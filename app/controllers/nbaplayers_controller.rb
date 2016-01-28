require 'mechanize'
require 'nokogiri'
require 'csv'
require 'json'
require 'open-uri'

class NbaplayersController < ApplicationController
  before_action except: [:index, :show, :home]
  before_action :set_nbaplayer, only: [:show, :edit, :update, :destroy]

  # GET /nbaplayers
  # GET /nbaplayers.json
  def list
    @nbaplayers = Nbaplayer.where(:position=> cookies[:sposition])
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
        [:avgpoints, 'td[8]/text()'],
        [:team, 'td[3]/text()'],
        [:cost, 'td[7]/text()']
      ].each do |name, xpath|
          player[name] = l.at_xpath(xpath).to_s.strip
      end
      Nbaplayer.create(:position=>player[:position],:name=>player[:name], :avgpoints=>player[:avgpoints], :team=>player[:team], :cost=>(player[:cost].tr('$','').tr(',','')).to_i, :id=>player[:id])
    end
    @player
    @lineup = Nbaplayer.where(:id =>LineupItem.select(:id).map(&:id))
  end
  # GET /nbaplayers/1
  # GET /nbaplayers/1.json
  def add_lineup_item
    LineupItem.create(:id => params[:li_id])
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
    @nbaplayer = Nbaplayer.new(nbaplayer_params)
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
    LineupItem.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to list_path }
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
      params.permit(:id, :name, :position, :team, :avgpoints, :cost)
    end

end
