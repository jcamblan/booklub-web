# frozen_string_literal: true

Fabricator(:book) do
  title { Faker::Book.title }
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
