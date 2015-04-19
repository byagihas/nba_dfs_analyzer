require "mechanize"
require "nokogiri"
require "open-uri"

class PlayerScraper
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def get_players
    list = html_doc.search('//tr[starts-with(@class, "playerSe")]')
    @players = list.collect do |l|
      player = {}
      [
        [:ppos, 'td[4]/text()'],
        [:pname, 'td[2]/a/text()'],
        [:pfppg, 'td[7]/text()'],
        [:pcost, 'td[6]/text()'],
      ].each do |name, xpath|
        player[name] = l.at_xpath(xpath).to_s.strip
      end
      player
    end
    @get_players = @players
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

end
