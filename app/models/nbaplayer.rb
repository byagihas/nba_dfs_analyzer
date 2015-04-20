<<<<<<< HEAD
require 'mechanize'
require 'nokogiri'
require 'open-uri'

class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints, :cost
=======
class Nbaplayer < ActiveRecord::Base
  validates_presence_of :name, :position, :team, :avgpoints
>>>>>>> 3083326312dc6908e454a7122e912b7f0a314b7b
  validates_numericality_of :avgpoints, greater_than: 0
end

