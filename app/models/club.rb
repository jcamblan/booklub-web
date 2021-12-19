# frozen_string_literal: true

class Club < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :club_users, dependent: :destroy
  has_many :users, through: :club_users
  has_many :read_sessions, dependent: :destroy

  before_validation :generate_invitation_code, on: :create
  after_commit :add_manager_to_users

  # generate a new unique code and assign it to instance
  # save is still required.
  def generate_invitation_code
    codes = Club.pluck(:invitation_code)
    self.invitation_code = nil

    while invitation_code.blank?
      # Generate a 8 digits string as code
      code = format('%06d', rand(10**8))
      # Each code must be unique
      next if codes.include?(code)

      self.invitation_code = code
    end

    self
  end

  # Automatically add club manager to club users list through callback
  def add_manager_to_users
    users << owner unless users.include?(owner)
  end
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
