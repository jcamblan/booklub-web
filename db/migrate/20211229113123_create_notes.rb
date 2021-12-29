# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.belongs_to :book, null: false, foreign_key: true, type: :uuid
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :read_session, null: false, foreign_key: true, type: :uuid
      t.integer :value

      t.timestamps
    end

    add_index :notes, %w[book_id read_session_id user_id], unique: true
  end
end
