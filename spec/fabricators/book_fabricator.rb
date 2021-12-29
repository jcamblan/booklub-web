# frozen_string_literal: true

Fabricator(:book) do
  title { Faker::Book.title }
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
