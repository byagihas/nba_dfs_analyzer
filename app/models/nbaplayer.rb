class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgfanduelpoints
end

