class SessionsController < ApplicationController

  # before_filter :authorize

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists and password is correct
    if user && user.authenticate(params[:password])
      # save user if inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if user's login doesn't work, redirect to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
