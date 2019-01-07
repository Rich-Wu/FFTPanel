module SessionsHelper
  def logged_in?
    if session[:id] == nil
      false
    else
      true
    end
  end
end
