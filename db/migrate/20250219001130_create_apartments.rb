class CreateApartments < ActiveRecord::Migration[8.0]
  def change
    create_table :apartments do |t|
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string :floor_level
      t.json :amenities, default: []

      t.timestamps
    end
  end
end
