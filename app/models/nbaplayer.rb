require 'mechanize'
require 'nokogiri'
require 'csv'
require 'json'
require 'open-uri'

class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints,:cost
  validates_numericality_of :avgpoints, greater_than: 0
  validates_uniqueness_of :name
  has_one :lineup_item
  has_one :lineup
  has_one :Nbateam

  def self.update_player
    agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    html = agent.get(url).body

    url = "http://www.rotowire.com/daily/nba/optimizer.htm"

    html_doc = Nokogiri::HTML(html)
    html_doc.encoding = 'utf-8'
    list = html_doc.search('//tr[starts-with(@class, "playerSe")]')
    @players = list.collect do |l|
      player = {}
      [
        [:position, 'td[5]/text()'],
        [:name, 'td[2]/a/text()'],
        [:avgpoints, 'td[8]/text()'],
        [:team, 'td[3]/text()'],
        [:cost, 'td[7]/text()']
      ].each do |name, xpath|
        player[name] = l.at_xpath(xpath).to_s.strip
      end
      self.update(:position=>player[:position],:name=>player[:name], :avgpoints=>player[:avgpoints], :team=>player[:team], :cost=>(player[:cost].tr('$','').tr(',','')).to_i, :id=>player[:id])
  end
end
end
