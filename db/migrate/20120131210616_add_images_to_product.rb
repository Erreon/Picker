class AddImagesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :images, :string
  end
end
