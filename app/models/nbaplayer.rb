class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints,:cost
  validates_numericality_of :avgpoints, greater_than: 0
  validates_uniqueness_of :name
  cost_limit = 50000
  has_many :lineup_items

  attr_accessor :name,:position,:team,:avgpoints,:cost

end
