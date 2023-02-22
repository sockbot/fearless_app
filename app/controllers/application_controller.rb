class ApplicationController < ActionController::Base

  before_action :authenticate!

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def authenticate!
    redirect_to login_path unless is_logged_in?
  end

  def is_logged_in?
    !!current_user
  end
end
