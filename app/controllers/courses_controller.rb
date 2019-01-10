class CoursesController < ApplicationController
  skip_before_action :verify_account, only: :index
  before_action :verify_admin, only: [:edit, :new, :create, :destroy]


  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      redirect_to course_path(id: @course.id)
    else
      p @course.errors.messages
      render 'new'
    end
  end

  def edit
    if request.method == "POST"
      @course = Course.find(params[:id])
      @course.update(course_params)
      redirect_to course_path
    elsif request.method == 'GET'
      @course = Course.find(params[:id])
      render 'edit'
    end
  end

  def index
    @courses = Course.all.limit(60).offset(params[:start])
  end

  def show
    begin
      @course = Course.find(params[:id])
      rescue ActiveRecord::RecordNotFound
    		puts 'Navigated to invalid /course/:id'
        puts 'Redirecting to Courses index'
    		redirect_to courses_path
    end
  end

  def destroy
    @course = Course.find(params[:id])
    respond_to do |format|
      format.js
    end
    @course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours, {cohort_ids: []})
  end

end
