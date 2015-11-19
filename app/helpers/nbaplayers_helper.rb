module NbaplayersHelper
  def init_position
    @@position = 'C'
  end

  def set_position(position)
    @@position = position
    format.html {redirect_to @nbaplayer }
  end
end
