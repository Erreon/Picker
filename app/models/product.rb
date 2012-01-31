class Product < ActiveRecord::Base
	validates_presence_of :price, :description, :yes, :no
end
