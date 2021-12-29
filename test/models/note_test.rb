# frozen_string_literal: true

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
