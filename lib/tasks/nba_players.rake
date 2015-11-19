desc 'Fetch NBADFSINFO'
task :fetch_nbainfo => :environment do

  require "nokogiri"
  require "open-uri"

  Nbaplayer.all.each do |nbaplayer|
    url = "http://www.lowes.ca/search/#{CGI.escape(product.title)}.html"
    doc = Nokogiri::HTML(open(url))
    player = doc.search('//tr[starts-with(@class, "playerSe")]'
    nbaplayer.update_attribute(:avgpoints, 'td[7]/text()')
    nbaplayer.update_attribute(:cost, 'td[6]/text()'.tr('$','').to_i)
    puts "Product #{Nbaplayer.id} has been updated with price #{cost}"
  end
end
