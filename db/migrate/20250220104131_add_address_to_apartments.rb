class AddAddressToApartments < ActiveRecord::Migration[8.0]
  def change
    remove_column :apartments, :street_name, :string
    remove_column :apartments, :street_number, :string

    add_column :apartments, :address, :string
  end
end
