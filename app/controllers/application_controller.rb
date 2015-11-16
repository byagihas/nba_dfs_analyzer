class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_lineup

  def current_lineup
    if !session[:lineup_id].nil?
      Lineup.find(session[:lineup_id])
    else
      Lineup.new
    end
  end

end
