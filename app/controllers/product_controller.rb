class ProductController < ApplicationController
  require 'open-uri'

    def index
      @products = Product.all
    end
    
	def show
	  @product = Product.find(params[:id])
	end

	def new
	  @product = Product.new
	end

	def create
		if params['url']
		  p = get_info(params['url'])
		  @product = Product.new(price: p[:price], description: p[:description], title: p[:title], map_url: p[:map_url])
   		  if @product.save
		   	flash[:notice] = "Success! Your product has been saved."
		  	redirect_to @product
		  else
		  	render :action => 'new'
		  end
		end
	end

	def get_info(url)
		doc = Nokogiri(open(url))
		price = doc.search('h2').to_s[/\$(\d+)/].gsub('$',"")
		title = doc.title
		description = doc.search('#userbody').to_s.split('<!--')[0].gsub(%r{</?[^>]+?>}, '').gsub(/\n/," ").strip
		if doc.to_s.match('maps.google.com')
			map_url = doc.search('small a')[0]['href'].match('maps.google.com').string
		end
		{ :price => price , :title => title, :description => description, :map_url => map_url }
	end
end