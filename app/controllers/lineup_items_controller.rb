class LineupItemsController < ApplicationController
  def create
    @lineup = current_lineup
    @lineup_item = @lineup.lineup_items.new(lineup_item_params)
    @lineup.save
    session[:lineup_id] = @lineup.id
  end

  def update
    @lineup = current_lineup
    @lineup_item = @lineup.lineup_items.find(params[:id])
    @lineup_item.update_attributes(lineup_item_params)
    @lineup_items = @lineup.lineup_items
  end

  def destroy
    @lineup = current_lineup
    @lineup_item = @lineup.lineup_items.find(params[:id])
    @lineup_item.destroy
    @lineup_items = @lineup.lineup_items
  end
private
  def lineup_item_params
    params.require(:lineup_item).permit(:quantity, :nbaplayer_id)
  end
end
