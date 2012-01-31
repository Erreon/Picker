class Product < ActiveRecord::Base
	validates_presence_of :price, :description, :votes
end
