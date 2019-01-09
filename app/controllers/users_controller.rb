class UsersController < ApplicationController
  skip_before_action :verify_account, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
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

  def instructors
    @users = User.all.where(instructor: true).limit(60).offset(params[:start])
    render 'index'
  end

  def students
    @users = User.all.where(instructor: false).limit(60).offset(params[:start])
    render 'index'
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

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :birthday, :education, :salary, :instructor, :cohort_id, :password_confirmation)
  end

end
