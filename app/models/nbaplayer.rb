class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints,:cost
  validates_numericality_of :avgpoints, greater_than: 0
  validates_uniqueness_of :name
  has_one :lineup_item
  has_one :lineup
  has_one :Nbateam
end
