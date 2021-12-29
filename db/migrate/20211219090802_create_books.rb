# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.float :average_note, null: false, default: 0
      t.integer :note_count, null: false, default: 0
      t.integer :selection_count, null: false, default: 0
      t.integer :submission_count, null: false, default: 0
      t.string :title
      t.string :google_book_id

      t.timestamps
    end
  end
end
