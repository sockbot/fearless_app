require 'rails_helper'

RSpec.describe "Profile", type: :request do

  describe "a logged in user can GET /users/id/profile/new" do
    before(:each) do
      @user = User.create(email: "hello@world.com", password: "Password1!")
      post sessions_path, :params => { email: @user.email, password: @user.password }  
    end

    it "renders the new profile template" do
      get new_profile_path
      expect(response).to have_http_status(200)
    end 
  end

  describe "an anonymous user cannot GET /profile/new" do
    before(:each) do
      @user = User.create(email: "hello@world.com", password: "Password1!")
    end

    it "redirects to login_path" do
      get new_profile_path
      expect(response).to redirect_to login_path
    end 
  end
end
