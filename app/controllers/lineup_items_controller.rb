class LineupItemsController < ApplicationController

  def new
    @lineup_item = LineupItem.new
  end

  def index
    @lineup_items = LineupItem.all
  end

  def create
    @lineup_item = LineupItem.new(lineup_item_params)
    respond_to do |format|
      if @lineup_item.save
        format.html { redirect_to list_path}
        format.json { render :show, status: :created, location: @lineup_item }
      else
        format.html { render :new }
        format.json { render json: @lineup_item.errors, status: :unprocessable_entity }
      end
    end
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
    params.permit(:id, :lineuposition)
  end
end
