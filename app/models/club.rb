class Club < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :club_users, dependent: :destroy
  has_many :users, through: :club_users

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
