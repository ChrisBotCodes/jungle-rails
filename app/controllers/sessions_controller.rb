class SessionsController < ApplicationController

  # before_filter :authorize

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end

    # # old authentication method
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   redirect_to '/login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
