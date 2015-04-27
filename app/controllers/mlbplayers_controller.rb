class MlbplayersController < ApplicationController
  before_action :set_mlbplayer, only: [:show, :edit, :update, :destroy]

  # GET /mlbplayers
  # GET /mlbplayers.json
  def index
    @mlbplayers = Mlbplayer.all
  end

  # GET /mlbplayers/1
  # GET /mlbplayers/1.json
  def show
  end

  # GET /mlbplayers/new
  def new
    @mlbplayer = Mlbplayer.new
  end

  # GET /mlbplayers/1/edit
  def edit
  end

  # POST /mlbplayers
  # POST /mlbplayers.json
  def create
    @mlbplayer = Mlbplayer.new(mlbplayer_params)

    respond_to do |format|
      if @mlbplayer.save
        format.html { redirect_to @mlbplayer, notice: 'Mlbplayer was successfully created.' }
        format.json { render :show, status: :created, location: @mlbplayer }
      else
        format.html { render :new }
        format.json { render json: @mlbplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mlbplayers/1
  # PATCH/PUT /mlbplayers/1.json
  def update
    respond_to do |format|
      if @mlbplayer.update(mlbplayer_params)
        format.html { redirect_to @mlbplayer, notice: 'Mlbplayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @mlbplayer }
      else
        format.html { render :edit }
        format.json { render json: @mlbplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mlbplayers/1
  # DELETE /mlbplayers/1.json
  def destroy
    @mlbplayer.destroy
    respond_to do |format|
      format.html { redirect_to mlbplayers_url, notice: 'Mlbplayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mlbplayer
      @mlbplayer = Mlbplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mlbplayer_params
      params.require(:mlbplayer).permit(:name, :team, :position, :battingpos, :salary, :avgpoints, :value)
    end
end
