desc "Update NBA Players"
task :nba_players => :environment do
    require 'mechanize'
    require 'nokogiri'
    require 'open-uri'

    url = "http://www.rotowire.com/daily/nba/optimizer.htm"
    agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    html = agent.get(url).body

    html_doc = Nokogiri::HTML(html)
    html_doc.encoding = 'utf-8'

    list = html_doc.search('//tr[starts-with(@class, "playerSe")]')
    @players = list.collect do |l|
      player = {}
      [
        [:position, 'td[5]/text()'],
        [:name, 'td[2]/a/text()'],
        [:avgpoints, 'td[7]/text()'],
        [:team, 'td[3]/text()'],
        [:cost, 'td[6]/text()']
      ].each do |name, xpath|
        player[name] = l.at_xpath(xpath).to_s.strip
      end
      player
    end
    @nbaplayers.update_attributes(@players)
end