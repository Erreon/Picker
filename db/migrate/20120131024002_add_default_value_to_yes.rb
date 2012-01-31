class AddDefaultValueToYes < ActiveRecord::Migration
  def change
  	change_column :products,:yes, :integer, :default => 0
  end
end
