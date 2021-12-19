# frozen_string_literal: true

class CreateClubUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :club_users, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :club, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end