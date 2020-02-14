module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def log_in(user)
     cookies.signed[:user_id] = user.id
  end

  def log_out
   cookies.delete(:user_id)
   @current_user = nil
  end

  def logged_in?
   !current_user.nil?
  end
end
