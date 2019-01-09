class SessionsController < ApplicationController
  skip_before_action :verify_account

  def new
    if logged_in?
      p "You are already logged in"
      redirect_to user_path(session[:id])
    else
      render 'new'
    end
  end

  def create
    login = User.all.find_by(email: params[:email])
    if !login
      @error = "User with email #{params[:email]} not found"
      render 'new'
    elsif login.password == params[:password]
      p "logged in"
      session[:id] = login.id
      redirect_to index_path
    else
      @error = "incorrect credentials provided"
      render 'new'
    end
  end

  def delete
    session[:id] = nil
    redirect_to root_path
  end
end
