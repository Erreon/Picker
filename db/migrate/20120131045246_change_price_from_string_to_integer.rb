class ChangePriceFromStringToInteger < ActiveRecord::Migration
  def up
  	change_column :products,:price, :integer
  end

  def down
  	change_column :products,:price, :string
  end
end
