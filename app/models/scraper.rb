require "mechanize"
require "nokogiri"
require "open-uri"
require "csv"
require "pp"

url = "http://www.rotowire.com/daily/mlb/optimizer.htm"
agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
html = agent.get(url).body

html_doc = Nokogiri::HTML(html)
html_doc.encoding = 'utf-8'

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

CSV.open("file.csv", "wb") do |csv|
  csv << @players
end

