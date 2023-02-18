class ProfilesController < ApplicationController

  before_action :authorize_own_profile

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to user_profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @profile = current_user.profile
  end

  private

  def authorize_own_profile
    if current_user.id != session[:user_id]
      redirect_to login_url, alert: "Not authorized" 
    end
  end

  def current_user
    @user ||= User.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:name, :handle, :icq)
  end
end