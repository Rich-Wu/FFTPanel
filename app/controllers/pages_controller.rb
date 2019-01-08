class PagesController < ApplicationController
  def index
  end

  def main
    render layout:false
  end
end
