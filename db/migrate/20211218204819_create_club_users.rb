# frozen_string_literal: true

class CreateClubUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :club_users, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :club, null: false, foreign_key: true, type: :uuid
      t.integer :session_count, default: 0, null: false
      t.integer :selection_count, default: 0, null: false
      t.integer :bonus_score, default: 0, null: false

      t.timestamps
    end

    add_index :club_users, %w[user_id club_id], unique: true
  end
end
