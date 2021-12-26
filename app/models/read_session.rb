# frozen_string_literal: true

class ReadSession < ApplicationRecord
  # == Constants ===============================================================

  STATES = %w[submission draw reading conclusion archived].freeze

  # == Attributes ==============================================================
  # == Extensions ==============================================================

  include AASM

  # == Relationships ===========================================================

  belongs_to :club, touch: true
  belongs_to :selected_book, optional: true, class_name: 'Book'
  has_many :submissions, dependent: :destroy
  # has_many :notes, dependent: :destroy

  has_many :users, through: :submissions, source: :user

  # == Validations =============================================================

  validates :submission_due_date, presence: true
  validates :read_due_date, presence: true
  validate :one_session_at_a_time, on: :create

  # == Scopes ==================================================================

  scope :unarchived, -> { where.not(state: :archived) }
  scope :active, -> { where(state: %i[submission draw reading]) }

  # == Callbacks ===============================================================

  after_create :apply_default_name
  after_create :archive_previous_session
  before_commit :set_next_step_date

  # == State Machine ===========================================================

  aasm column: 'state' do # rubocop:disable Metrics/BlockLength
    state :submission, initial: true, display: I18n.t('models.read_.state.submission')
    state :draw, display: I18n.t('models.read_session.state.draw')
    state :reading, display: I18n.t('models.read_session.state.reading')
    state :conclusion, display: I18n.t('models.read_session.state.conclusion')
    state :archived, display: I18n.t('models.read_session.state.archived')

    event :start_draw do
      after do
        if submissions.count.zero?
          destroy!
        else
          SessionDrawJob.perform_later(self)
        end
      end

      transitions from: :submission, to: :draw
    end

    event :start_reading do
      before do
        # TODO: Send notification
      end

      transitions from: :draw, to: :reading
    end

    event :conclude do
      transitions from: :reading, to: :conclusion
    end

    event :archive do
      transitions from: :conclusion, to: :archived
    end
  end

  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def submitted_books
    Book.where_assoc_exists(:submissions, read_session_id: id)
  end

  def selected_book_submitters
    return if %w[submission draw].include?(state)

    User.joins(:submissions).where(submissions: { read_session: self, book: selected_book })
  end

  def one_session_at_a_time
    return if club.read_sessions.active.count.zero?

    errors.add(:state, :one_session_at_a_time, message: 'Il y a déjà une session en cours')
  end

  def apply_default_name
    return if name.present?

    index = club.read_sessions.order(created_at: :asc).find_index(self)
    update(name: "Session ##{index + 1}")
  end

  def archive_previous_session
    club.read_sessions.where(state: :conclusion).find_each(&:archive!)
  end

  def state_precedes?(state_comparison)
    STATES.find_index(state) < STATES.find_index(state_comparison.to_s)
  end

  def state_follows?(state_comparison)
    STATES.find_index(state) > STATES.find_index(state_comparison.to_s)
  end

  def set_next_step_date
    self.next_step_date = state_follows?('draw') ? read_due_date : submission_due_date
  end
end

# == Schema Information
#
# Table name: read_sessions
#
#  id                  :uuid             not null, primary key
#  name                :string
#  next_step_date      :datetime
#  read_due_date       :datetime
#  state               :string
#  submission_due_date :datetime
#  club_id             :uuid             not null
#  selected_book_id    :uuid
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_read_sessions_on_club_id           (club_id)
#  index_read_sessions_on_selected_book_id  (selected_book_id)
#
