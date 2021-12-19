# frozen_string_literal: true

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: sessions
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
#  index_sessions_on_club_id           (club_id)
#  index_sessions_on_selected_book_id  (selected_book_id)
#
