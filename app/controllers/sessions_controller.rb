class SessionsController < ApplicationController
  before_action :set_user, only: :create
  before_action :user_logged?, only: :destroy

  def new
  end

  def create
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private

  def set_user
    @user = User.find_by_email(params[:session][:email])
  end
end
