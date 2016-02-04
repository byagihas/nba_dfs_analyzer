#Nbaplayers Controller
#Creates Nbaplayers and associates them?

class NbaplayersController < ApplicationController
  before_action except: [:index, :show, :home]
  before_action :set_nbaplayer, only: [:show, :edit, :update, :destroy]

  #- Scrapes data from Rotowire DFS Optimizer, storing information into Nbaplayers
  #- Displays Nbaplayers on list page
  #Need to add daily sorting?
  #Possibly migrate creation functionality to model
  def list
    @nbaplayers = Nbaplayer.where(:position=> cookies[:gposition])
    @pg1 = Nbaplayer.find_by(:id => cookies[:PG1]).name
    @pg2 = Nbaplayer.find_by(:id => cookies[:PG2]).name
    @sg1 = Nbaplayer.find_by(:id => cookies[:SG1]).name
    @sg2 = Nbaplayer.find_by(:id => cookies[:SG2]).name
    @sf1 = Nbaplayer.find_by(:id => cookies[:SF1]).name
    @sf2 = Nbaplayer.find_by(:id => cookies[:SF2]).name
    @pf1 = Nbaplayer.find_by(:id => cookies[:PF1]).name
    @pf2 = Nbaplayer.find_by(:id => cookies[:PF2]).name
    @c = Nbaplayer.find_by(:id => cookies[:C]).name
    @lineup = Nbaplayer.where(:id => LineupItem.select(:id).map(&:id))

  end
  #Creates Lineup Item for Nbaplayer identification
  def add_lineup_item
    LineupItem.create(:id => cookies[:li_id], :lineuposition => cookies[:lposition])
    cookies[cookies[:sposition].to_sym] = params[:li_id]
    redirect_to list_path
  end

  def show
  end
  # GET /nbaplayers/new
  def new
    @nbaplayer = Nbaplayer.new
  end

  def index
  end
  # GET /nbaplayers/1/edit
  def edit
  end
  # POST /nbaplayers
  # POST /nbaplayers.json
  def create
    @nbaplayer = Nbaplayer.new(nbaplayer_cookies)
    respond_to do |format|
      if @nbaplayer.save
        format.html { redirect_to list_path}
        format.json { render :show, status: :created, location: @nbaplayer }
      else
        format.html { render :new }
        format.json { render json: @nbaplayer.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /nbaplayers/1
  # PATCH/PUT /nbaplayers/1.json
  def update
    respond_to do |format|
      if @nbaplayer.update(nbaplayer_cookies)
        format.html { redirect_to @nbaplayer, notice: 'Nbaplayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @nbaplayer }
      else
        format.html { render :edit }
        format.json { render json: @nbaplayer.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /nbaplayers/1
  # DELETE /nbaplayers/1.json
  def destroy
    LineupItem.destroy(cookies[:id])
    respond_to do |format|
      format.html { redirect_to list_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nbaplayer
      @nbaplayer = Nbaplayer.find(cookies[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nbaplayer_cookies
      cookies.permit(:id, :name, :position, :team, :avgpoints, :cost)
    end

end
