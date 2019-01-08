class UsersController < ApplicationController
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
  end

  def index
    @users = User.all
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :education, :salary, :instructor, :cohort_id, :password_confirmation)
  end

end
