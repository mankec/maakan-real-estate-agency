class CreateApartments < ActiveRecord::Migration[8.0]
  def change
    create_table :apartments do |t|
      t.string :street_name
      t.string :street_number
      t.string :city
      t.string :zip_code
      t.decimal :size
      t.decimal :price, precision: 10, scale: 2

      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string :floor_level
      t.json :amenities, default: []

      t.timestamps
    end
  end
end
