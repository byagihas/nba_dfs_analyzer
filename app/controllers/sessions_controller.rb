class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.alert = 'Invalid email/password combination. Please try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully signed out!'
  end
<<<<<<< HEAD

=======
>>>>>>> 3083326312dc6908e454a7122e912b7f0a314b7b
end
