# frozen_string_literal: true

class Book < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  has_many :submissions, dependent: :nullify
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  has_one_attached :cover

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
#  average_note     :float
#  note_count       :integer
#  selection_count  :integer
#  submission_count :integer
#  title            :string
#  google_book_id   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
