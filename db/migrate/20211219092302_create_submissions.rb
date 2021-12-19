# frozen_string_literal: true

class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions, id: :uuid do |t|
      t.belongs_to :book, null: false, foreign_key: true, type: :uuid
      t.belongs_to :read_session, null: false, foreign_key: true, type: :uuid
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
