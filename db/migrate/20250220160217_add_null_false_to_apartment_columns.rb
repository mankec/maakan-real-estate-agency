class AddNullFalseToApartmentColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :apartments, :floor_level, :floor

    change_column_null :apartments, :address, false
    change_column_null :apartments, :city, false
    change_column_null :apartments, :zip_code, false
    change_column_null :apartments, :size, false
    change_column_null :apartments, :price, false

    change_column_null :apartments, :bedroom_count, false
    change_column_null :apartments, :bathroom_count, false
    change_column_null :apartments, :floor, false

    change_column_default :apartments, :bathroom_count, from: 0, to: 1
    change_column_default :apartments, :bedroom_count, from: 0, to: 1
  end
end
