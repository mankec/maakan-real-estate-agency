class AddPropertyTypeAndRegionToApartmentsAndVillas < ActiveRecord::Migration[8.0]
  def change
    add_column :apartments, :property_type, :string, default: "apartment"
    add_column :apartments, :region, :string, null: false

    add_column :villas, :property_type, :string, default: "villa"
    add_column :villas, :region, :string, null: false
  end
end
