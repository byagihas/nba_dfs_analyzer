class Lineup < ActiveRecord::Base
  belongs_to :line_up_status
  has_many :lineup_items
  before_create :set_lineup_status
  before_save :update_total

  def total
    lineup_items.collect{ |oi| oi.valid? ? (oi.quantity*oi.player_cost) : 0}.sum
  end
private
  def set_lineup_status
    self.lineup_status_id = 1
  end
  def update_total
    self[:total] = total
  end
end
