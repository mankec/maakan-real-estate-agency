class AddUserAndStatusToApartments < ActiveRecord::Migration[8.0]
  def change
    add_reference :apartments, :user, null: false, foreign_key: true

    add_column :apartments, :status, :integer, null: false
  end
end
