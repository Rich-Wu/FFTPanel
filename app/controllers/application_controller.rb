include ::ApplicationHelper

class ApplicationController < ActionController::Base
  before_action :verify_account

  private

  def verify_account
    if !logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to login_path
    end
  end

  def verify_admin
    if !admin?
      flash[:error] = "You must be an admin to do that"
      redirect_to index_path
    end
  end
  
end
