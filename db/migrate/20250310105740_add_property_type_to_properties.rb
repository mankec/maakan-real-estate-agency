class AddPropertyTypeToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :property_type, :string, null: false
  end
end
