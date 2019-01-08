class UsersController < ApplicationController
  before_action :verify_account, only: [:edit, :update, :index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      if user_params[:cohort_id] != ""
        Cohort.find(user_params[:cohort_id]).users << @user
      end
      session[:id] = @user.id
      redirect_to user_path(id: @user.id)
    else
      p @user.errors.messages
      render 'new'
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(session[:id])
    @user.update(user_params)
    redirect_to myInfo_path
  end

  def index
    @users = User.all.limit(60).offset(params[:start])
  end

  def show
    begin
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
    		puts 'Navigated to invalid /users/:id'
        puts 'Redirecting to Users index'
    		redirect_to users_path
    end
  end

  private

  def verify_account
    if logged_in? == false
      flash[:error] = "You must be logged in to do that"
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :birthday, :education, :salary, :instructor, :cohort_id, :password_confirmation)
  end

end
