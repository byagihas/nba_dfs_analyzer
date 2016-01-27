class LineupsController < ApplicationController
  def show
    @lineup_items = current_lineup.lineup_items
  end

  def add_pg1
    cookies[:sposition] = "PG"
    redirect_to root_url
  end

  def add_pg2
    cookies[:sposition] = "PG"
    redirect_to root_url
  end

  def add_sg1
    cookies[:sposition] = "SG"
    redirect_to root_url
  end

  def add_sg2
    cookies[:sposition] = "SG"
    redirect_to root_url
  end

  def add_sf1
    cookies[:sposition] = "SF"
    redirect_to root_url
  end

  def add_sf2
    cookies[:sposition] = "SF"
    redirect_to root_url
  end

  def add_pf1
    cookies[:sposition] = "PF"
    redirect_to root_url
  end

  def add_pf2
    cookies[:sposition] = "PF"
    redirect_to root_url
  end

  def add_c
    cookies[:sposition] = "C"
    redirect_to root_url
  end
end
