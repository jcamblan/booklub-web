# frozen_string_literal: true

class Book < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  has_many :submissions, dependent: :nullify
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :notes, dependent: :destroy

  has_one_attached :cover
  # has_one_attached :cover do |attachable|
  #   attachable.variant :thumb, resize_to_fill: [300, 450]
  # end

  # == Validations =============================================================

  validates :title, presence: true

  # == Scopes ==================================================================

  scope :search, lambda { |search|
                   joins(:authors).where(
                     'books.title ILIKE ? OR authors.name ILIKE ?',
                     "%#{search}%",
                     "%#{search}%"
                   )
                 }

  # == Callbacks ===============================================================

  after_create :fetch_google_attributes

  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def fetch_google_attributes
    FetchGoogleBookAttributesJob.perform_later(id)
  end
end

# == Schema Information
#
# Table name: books
#
#  id               :uuid             not null, primary key
#  average_note     :float            default("0.0"), not null
#  note_count       :integer          default("0"), not null
#  selection_count  :integer          default("0"), not null
#  submission_count :integer          default("0"), not null
#  title            :string
#  google_book_id   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
