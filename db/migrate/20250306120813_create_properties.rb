class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :region, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.decimal :size, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :status, null: false, default: :for_sell
      t.json :amenities, default: []

      t.timestamps
    end

    add_reference :properties, :user, null: false, foreign_key: true
  end
end
