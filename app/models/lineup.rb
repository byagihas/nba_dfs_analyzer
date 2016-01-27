class Lineup < ActiveRecord::Base
  validates_presence_of :pg1,:pg2,:sg1,:sg2,:sf1,:sf2,:pf1,:pf2,:center
  belongs_to :line_up_status
  has_many :lineup_items
  has_many :nbaplayers
  before_create :set_lineup_status
  before_save :update_total

  def total
    lineup_items.collect{ |oi| oi.valid? ? (oi.quantity*oi.cost) : 0}.sum
  end


private
  def set_lineup_status
    self.lineup_status_id = 1
  end
  def update_total
    self[:total] = total
  end
end
