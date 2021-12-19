# frozen_string_literal: true

Fabricator(:club) do
  name { Faker::FunnyName.three_word_name }
  owner { Fabricate(:user) }
end
