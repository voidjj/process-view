class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def user_logged?
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
