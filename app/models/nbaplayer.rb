class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints
  validates_numericality_of :avgpoints, greater_than: 0
  validates_uniqueness_of :name
  cost_limit = 50000
  has_many :lineup_items

  def only_has_two_pg
  end

end
