# frozen_string_literal: true

Fabricator(:user) do
  email { Faker::Internet.email }
  encrypted_password { 'password' }
  username { Faker::Name.name }
end
