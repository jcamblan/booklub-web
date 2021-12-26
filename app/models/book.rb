# frozen_string_literal: true

class Book < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  has_many :submissions, dependent: :nullify
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

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
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================
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
