class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      if user_params[:cohort_id] != nil
        p user_params
        Cohort.find(user_params[:cohort_id]).users << @user
      end
      redirect_to user_path(id: @user.id)
    else
      p @user.errors.messages
      render 'new'
    end
  end

  def edit
    begin
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        puts 'Navigated to invalid /user/:id'
        puts 'Redirecting to Users index'
        redirect_to users_path
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :education, :salary, :instructor, :cohort_id)
  end

end
