# frozen_string_literal: true

class Note < ApplicationRecord
  # == Constants ===============================================================

  VALID_NOTES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].freeze

  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================

  belongs_to :read_session
  belongs_to :book
  belongs_to :user

  # == Validations =============================================================

  validates :book_id, uniqueness: { scope: %w[read_session_id user_id] }

  # == Scopes ==================================================================
  # == Callbacks ===============================================================

  counter_culture :book, column_name: 'note_count'

  after_commit :update_book_average_note

  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def update_book_average_note
    book.update(average_note: book.notes.average(:value))
  end
end

# == Schema Information
#
# Table name: notes
#
#  id              :uuid             not null, primary key
#  book_id         :uuid             not null
#  user_id         :uuid             not null
#  read_session_id :uuid             not null
#  value           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_notes_on_book_id                                  (book_id)
#  index_notes_on_book_id_and_read_session_id_and_user_id  (book_id,read_session_id,user_id) UNIQUE
#  index_notes_on_read_session_id                          (read_session_id)
#  index_notes_on_user_id                                  (user_id)
#
