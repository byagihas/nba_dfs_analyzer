require 'mechanize'
require 'nokogiri'
require 'open-uri'

class NbaplayersController < ApplicationController
  before_action :only_allow_signed_in_users, except: [:index, :show, :home]
  before_action :set_nbaplayer, only: [:show, :edit, :update, :destroy]

  # GET /nbaplayers
  # GET /nbaplayers.json
  def index
    @nbaplayers = Nbaplayer.all
  end

  def list
    url = "http://www.rotowire.com/daily/nba/optimizer.htm"
    agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    html = agent.get(url).body

    html_doc = Nokogiri::HTML(html)
    html_doc.encoding = 'utf-8'

    list = html_doc.search('//tr[starts-with(@class, "playerSe")]')
    @players = list.collect do |l|
      player = {}
      [
        [:position, 'td[5]/text()'],
        [:name, 'td[2]/a/text()'],
        [:avgpoints, 'td[7]/text()'],
        [:team, 'td[3]/text()'],
        [:cost, 'td[6]/text()']
      ].each do |name, xpath|
        player[name] = l.at_xpath(xpath).to_s.strip
      end
    player
    end
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
    @nbaplayers = @players
    respond_to do |format|
      if @nbaplayer.save
        format.html { redirect_to nbaplayers_path }
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
      format.html { redirect_to nbaplayers_url}
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
      params.permit(:name, :position, :team, :avgpoints, :cost)
    end
end
