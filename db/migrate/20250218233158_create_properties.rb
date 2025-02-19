class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.decimal :size
      t.decimal :price, precision: 10, scale: 2
      t.belongs_to :propertyable, polymorphic: true
      t.timestamps
    end

    add_reference :properties, :user, null: false, foreign_key: true
  end
end
