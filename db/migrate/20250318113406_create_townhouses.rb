class CreateTownhouses < ActiveRecord::Migration[8.0]
  def change
    create_table :townhouses do |t|
      t.integer :floors, null: false, default: 2
      t.integer :bedroom_count, null: false, default: 1
      t.integer :bathroom_count, null: false, default: 1

      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
