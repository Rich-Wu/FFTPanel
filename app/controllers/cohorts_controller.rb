class CohortsController < ApplicationController

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      if cohort_params[:course_id] != ""
        Course.find(user_params[:course_id]).cohorts << @cohort
      end
      redirect_to cohort_path(id: @cohort.id)
    else
      p @user.errors.messages
      render 'new'
    end
  end

  def edit
    begin
      @cohort = Cohort.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        puts 'Navigated to invalid /cohort/:id'
        puts 'Redirecting to Cohorts index'
        redirect_to cohorts_path
    end
  end

  def index
    @users = User.all
  end

  def show
    begin
      @cohort = Cohort.find(params[:id])
      rescue ActiveRecord::RecordNotFound
    		puts 'Navigated to invalid /cohorts/:id'
        puts 'Redirecting to Cohorts index'
    		redirect_to cohorts_path
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :course_id)
  end

end
