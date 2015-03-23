class NbaplayersController < ApplicationController
  before_action :set_nbaplayer, only: [:show, :edit, :update, :destroy]

  # GET /nbaplayers
  # GET /nbaplayers.json
  def index
    @nbaplayers = Nbaplayer.all
  end

  # GET /nbaplayers/1
  # GET /nbaplayers/1.json
  def show
  end

  # GET /nbaplayers/new
  def new
    @nbaplayer = Nbaplayer.new
  end

  # GET /nbaplayers/1/edit
  def edit
  end

  # POST /nbaplayers
  # POST /nbaplayers.json
  def create
    @nbaplayer = Nbaplayer.new(nbaplayer_params)

    respond_to do |format|
      if @nbaplayer.save
        format.html { redirect_to @nbaplayer, notice: 'Nbaplayer was successfully created.' }
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
      if @nbaplayer.update(nbaplayer_params)
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
    @nbaplayer.destroy
    respond_to do |format|
      format.html { redirect_to nbaplayers_url, notice: 'Nbaplayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nbaplayer
      @nbaplayer = Nbaplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nbaplayer_params
      params.require(:nbaplayer).permit(:name, :position, :team, :avgfanduelpoints, :is_starting_lineup)
    end
end
