class LineupsController < ApplicationController
  def show
    @lineup_items = current_lineup.lineup_items
  end

  def add_pg1
    cookies[:sposition] = "PG1"
    cookies[:gposition] = "PG"

    redirect_to root_url
  end

  def add_pg2
    cookies[:sposition] = "PG2"
    cookies[:gposition] = "PG"

    redirect_to root_url
  end

  def add_sg1
    cookies[:sposition] = "SG1"
    cookies[:gposition] = "SG"

    redirect_to root_url
  end

  def add_sg2
    cookies[:sposition] = "SG2"
    cookies[:gposition] = "SG"

    redirect_to root_url
  end

  def add_sf1
    cookies[:sposition] = "SF1"
    cookies[:gposition] = "SF"

    redirect_to root_url
  end

  def add_sf2
    cookies[:sposition] = "SF2"
    cookies[:gposition] = "SF"

    redirect_to root_url
  end

  def add_pf1
    cookies[:sposition] = "PF1"
    cookies[:gposition] = "PF"

    redirect_to root_url
  end

  def add_pf2
    cookies[:sposition] = "PF2"
    cookies[:gposition] = "PF"

    redirect_to root_url
  end

  def add_c
    cookies[:sposition] = "C"
    cookies[:gposition] = "C"

    redirect_to root_url
  end
end
