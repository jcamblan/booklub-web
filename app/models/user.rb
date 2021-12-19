# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_many :club_users, dependent: :destroy
  has_many :clubs, through: :club_users
end
