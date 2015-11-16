class LineupsController < ApplicationController
  def show
    @lineup_items = current_lineup.lineup_items
  end
end
