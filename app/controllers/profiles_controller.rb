class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @profile = current_user.profile
    redirect_to new_profile_path unless @profile
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :handle, :icq)
  end
end