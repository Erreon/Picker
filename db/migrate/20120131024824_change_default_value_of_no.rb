class ChangeDefaultValueOfNo < ActiveRecord::Migration
  def up
  	change_column :products,:no, :integer, :default => 0
  end

  def down
    change_column :products,:no, :integer
  end
end
