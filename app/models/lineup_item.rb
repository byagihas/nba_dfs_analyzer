class LineupItem < ActiveRecord::Base
    belongs_to :nbaplayer
    belongs_to :lineup

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validate :nbaplayer_present
    validate :lineup_present

    before_save :finalize

    def player_cost
      if persisted?
        self[:player_cost]
      else
        nbaplayer.cost
      end
    end

    def total_cost
      player_cost * quantity
    end

  private
    def player_present
      if nbaplayer.nil?
        errors.add(:nbaplayer, "is not valid or is not active.")
      end
    end

    def lineup_present
      if lineup.nil?
        errors.add(:lineup, "is not a valid order.")
      end
    end

    def finalize
      self[:player_cost] = player_cost
      self[:total_cost] = quantity * self[:player_cost]
    end
end
