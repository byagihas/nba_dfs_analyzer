class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints
  validates_numericality_of :avgpoints, greater_than: 0
  validates_uniqueness_of :name
end

