class CreateVillas < ActiveRecord::Migration[8.0]
  def change
    create_table :villas do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.decimal :size, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :status, null: false
      t.integer :bedroom_count, default: 1, null: false
      t.integer :bathroom_count, default: 1, null: false
      t.json :amenities, default: []

      t.timestamps
    end

    add_reference :villas, :user, null: false, foreign_key: true
  end
end
