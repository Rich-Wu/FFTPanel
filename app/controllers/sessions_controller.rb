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
    @user = User.find_by(:email)
    if @user == nil
      p 'User with email ' + params[:email] + " not found"
      render 'new'
    elsif @user.password == params[:password]
      session[:id] = @user.id
    else
      p "incorrect credentials provided"
      render 'new'
    end
  end

  def delete
  end
end
