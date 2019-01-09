include ::ApplicationHelper

class ApplicationController < ActionController::Base
  before_action :verify_account

  private

  def verify_account
    if logged_in? == false
      flash[:error] = "You must be logged in to do that"
      redirect_to login_path
    end
  end
end
