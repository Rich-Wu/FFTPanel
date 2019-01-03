class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    # if @user.valid?
    #   p params
    #   @user.save
    #   redirect_to users_path
    # else
    #   p params
    #   p @user.errors.messages
    #   render 'new'
    # end
    redirect_to root_path
  end

  def edit
  end

  def index
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :education)
  end

end
