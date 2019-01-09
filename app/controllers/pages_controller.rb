class PagesController < ApplicationController
  skip_before_action :verify_account, only: :main

  def index
    @user = User.find(session[:id])
  end

  def main
    render layout:false
  end
end
