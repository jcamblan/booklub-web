# frozen_string_literal: true

class CreateReadSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :read_sessions, id: :uuid do |t|
      t.string :name
      t.datetime :next_step_date
      t.datetime :read_due_date
      t.string :state
      t.datetime :submission_due_date
      t.belongs_to :club, null: false, foreign_key: true, type: :uuid
      t.belongs_to :selected_book, null: true, type: :uuid, foreign_key: { to_table: :books }
      t.boolean :ignore_bonus_score, default: false

      t.timestamps
    end
  end
end
