# frozen_string_literal: true

Fabricator(:club) do
  name { Faker::FunnyName.three_word_name }
  owner { Fabricate(:user) }
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
#  index_clubs_on_invitation_code  (invitation_code) UNIQUE
#  index_clubs_on_name             (name)
#  index_clubs_on_owner_id         (owner_id)
#
