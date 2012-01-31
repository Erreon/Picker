class Product < ActiveRecord::Base
	validates_presence_of :price, :description, :votes
	serialize :images

	def self.new_from_url(url)
		doc = Nokogiri(open(url))
		price = doc.search('h2').to_s[/\$(\d+)/].gsub('$',"")
		title = doc.title
		description = doc.search('#userbody').to_s.split('<!--')[0].gsub(%r{</?[^>]+?>}, '').gsub(/\n/," ").strip
		if doc.to_s.match('maps.google.com')
			map_url = doc.search('small a')[0]['href'].match('maps.google.com').string
		end
		images = doc.search('table img').map {|i| i['src']}
		new({ :price => price , :title => title, :description => description, :map_url => map_url, :images => images })
	end
end
