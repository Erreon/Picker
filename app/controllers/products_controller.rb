class ProductsController < ApplicationController
  require 'open-uri'

  def index
    @products = Product.all
  end

  def up_vote
    @product = Product.find(params[:id])
    @product.votes += 1
    if @product.save
		  flash[:notice] = "Success! Your product has been saved."
		  redirect_to :action => 'index'
	  end
  end

  def down_vote
    @product = Product.find(params[:id])
    @product.votes -= 1
    @product.save
    if @product.save
	  	flash[:notice] = "Success! Your product has been saved."
		  redirect_to :action => 'index'
	  end
  end

	def show
	  @product = Product.find(params[:id])
	end

	def new
	  @product = Product.new
	end

	def create
		if params['url']
		  @product = Product.new_from_url(params['url'])
   	  if @product.save
		 	  flash[:notice] = "Success! Your product has been saved."
			  redirect_to @product
		  else
		  	render :action => 'new'
		  end
		end
	end
end
