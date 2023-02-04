class ProfileController < ApplicationController
  def new
    @profile = Profile.new
  end
  
  def index
  end
end