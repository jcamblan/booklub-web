# frozen_string_literal: true

class AddIndexOnClubsInvitationCode < ActiveRecord::Migration[7.0]
  def change
    add_index :clubs, :invitation_code, unique: true
  end
end
