# frozen_string_literal: true

class User < ApplicationRecord
  # == Constants ===============================================================
  # == Attributes ==============================================================
  # == Extensions ==============================================================

  include Clearance::User

  # == Relationships ===========================================================

  has_many :club_users, dependent: :destroy
  has_many :clubs, through: :club_users
  has_many :sessions, through: :clubs
  has_many :submissions, dependent: :destroy

  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == Class Methods ===========================================================
  # == Instance Methods ========================================================

  def gravatar_url
    hashed_email = Digest::MD5.hexdigest(email)

    "https://www.gravatar.com/avatar/#{hashed_email}"
  end
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
