class ProfileController < ApplicationController
  def new
    @profile = Profile.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.profile = Profile.new(profile_params)

    if user.profile.save
      redirect_to user_profile_index_path
    else
      puts "Profile didn't save"
      render :new
    end
  end

  def index
    @profile = User.find(params[:user_id]).profile
  end

  def profile_params
    params.require(:profile).permit(:name, :handle, :icq)
  end
end