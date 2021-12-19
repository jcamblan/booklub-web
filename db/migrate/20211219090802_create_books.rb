# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.float :average_note
      t.integer :note_count
      t.integer :selection_count
      t.integer :submission_count
      t.string :title
      t.string :google_book_id

      t.timestamps
    end
  end
end
