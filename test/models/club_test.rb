# frozen_string_literal: true

require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: clubs
#
#  id              :uuid             not null, primary key
#  invitation_code :string
#  name            :string
#  owner_id        :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_clubs_on_name      (name)
#  index_clubs_on_owner_id  (owner_id)
#
