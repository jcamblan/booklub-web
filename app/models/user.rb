# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_many :club_users, dependent: :destroy
  has_many :clubs, through: :club_users
end

# == Schema Information
#
# Table name: users
#
#  id                 :uuid             not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  username           :string
#
# Indexes
#
#  index_users_on_email           (email)
#  index_users_on_remember_token  (remember_token)
#  index_users_on_username        (username) UNIQUE
#
