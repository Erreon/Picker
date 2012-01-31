class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :price
      t.string :title
      t.string :address
      t.text :images
      t.text :description
      t.string :map_url
      t.integer :votes, :default => 0
      t.timestamps
    end
  end
end
