class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs, id: :uuid do |t|
      t.string :invitation_code
      t.string :name
      t.belongs_to :owner, null: false, type: :uuid, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :clubs, :name
  end
end
