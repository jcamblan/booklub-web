# frozen_string_literal: true

require 'test_helper'

class ClubUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: club_users
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  club_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_club_users_on_club_id  (club_id)
#  index_club_users_on_user_id  (user_id)
#