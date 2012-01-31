class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :price
      t.string :address
      t.text :description
      t.string :map_url
      t.integer :yes
      t.integer :no

      t.timestamps
    end
  end
end
