class LineupItem < ActiveRecord::Base
    belongs_to :nbaplayer
    belongs_to :lineup


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
    def nbaplayer_present
      if nbaplayer.nil?
        errors.add(:nbaplayer, "is not valid or is not active.")
      end
    end

    def lineup_present
      if lineup.nil?
        errors.add(:lineup, "is not a valid order.")
      end
    end

end
