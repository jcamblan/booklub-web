# frozen_string_literal: true

require 'test_helper'

class AuthorBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: author_books
#
#  id         :uuid             not null, primary key
#  author_id  :uuid             not null
#  book_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_author_books_on_author_id  (author_id)
#  index_author_books_on_book_id    (book_id)
#
