class RemovePropertyColumnsFromApartmentsAndVillas < ActiveRecord::Migration[8.0]
  def change
    remove_column :apartments, :city, :string
    remove_column :apartments, :address, :string
    remove_column :apartments, :zip_code, :string
    remove_column :apartments, :size, :string
    remove_column :apartments, :price, :string
    remove_column :apartments, :status, :string
    remove_column :apartments, :amenities, :json

    remove_column :villas, :city, :string
    remove_column :villas, :address, :string
    remove_column :villas, :zip_code, :string
    remove_column :villas, :size, :string
    remove_column :villas, :price, :string
    remove_column :villas, :status, :string
    remove_column :villas, :amenities, :json

    remove_reference :apartments, :user
    remove_reference :villas, :user

    add_reference :apartments, :property, null: false, foreign_key: true
    add_reference :villas, :property, null: false, foreign_key: true
  end
end
