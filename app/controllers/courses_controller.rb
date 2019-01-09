class CoursesController < ApplicationController
  skip_before_action :verify_account, only: :index

  def new
  end

  def edit
  end

  def index
  end

  def show
  end
end
