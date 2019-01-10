class UsersController < ApplicationController
  skip_before_action :verify_account, only: [:new, :create]
  before_action :verify_admin, only: :edit

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = Dir.entries("app/assets/images/portraits")[rand(Dir.entries("app/assets/images/portraits").length)]
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
    if request.method == "POST"
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_edit_path
    elsif request.method == 'GET'
      @user = User.find(params[:id])
      render 'edit'
    end
  end

  def update
    if request.method == "POST"
      @user = User.find(session[:id])
      @user.update(user_params)
      redirect_to myInfo_path
    elsif request.method == 'GET'
      @user = User.find(session[:id])
      render 'edit'
    end
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
