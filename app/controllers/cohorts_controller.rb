class CohortsController < ApplicationController
  def new
    @cohort = Cohort.new
  end

  def create
    p params
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      redirect_to cohort_path(id: @cohort.id)
    else
      p @cohort.errors.messages
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
    @cohorts = Cohort.all
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

  def destroy
    @cohort = Cohort.find(params[:id])
    respond_to do |format|
      format.js
    end
    @cohort.destroy
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date, :course_id)
  end

end
