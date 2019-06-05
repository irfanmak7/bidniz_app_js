class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :description
      t.text :address
      t.integer :price
      t.timestamps
    end
  end
end
