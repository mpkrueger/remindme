class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_phone_number(params[:phone_number])
    puts params
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Uh oh, we don't recognize you. Please try to log in again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
