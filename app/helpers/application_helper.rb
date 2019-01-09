module ApplicationHelper
  def logged_in?
    if session[:id] == nil
      false
    else
      true
    end
  end

  def admin?
    if !session[:id]
      false
    else
      user = User.find(session[:id])
      user.admin ? true : false
    end
  end
  
end
