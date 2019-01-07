include ::SessionsHelper

class SessionsController < ApplicationController
  def new
    if logged_in?
      p "You are already logged in"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create
    @user = User.all.find_by(email: params[:session][:email])
    if @user == nil
      @error = "User with email #{params[:session][:email]} not found"
      render 'new'
    elsif @user.password == params[:session][:password]
      p "logged in"
      session[:id] = @user.id
      redirect_to root_path
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
