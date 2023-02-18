require 'rails_helper'

RSpec.describe "Profile", type: :request do

  describe "a logged in user can GET /users/id/profile/new" do
    before(:all) do
      @user = User.new(email: "hello@world.com", password: "Password1!")
      @user.save
      post sessions_path, :params => { email: @user.email, password: @user.password }  
    end

    it "renders the new profile template" do
      get new_user_profile_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end 

    after(:all) do
      session[@user.id] = nil
      @user.delete
    end
  end

  describe "an anonymous user cannot GET /users/id/profile/new" do
    before(:all) do
      @user = User.new(email: "hello@world.com", password: "Password1!")
      @user.save
    end

    it "redirects to login_path" do
      get new_user_profile_path(user_id: @user.id)
      expect(response).to redirect_to login_path
    end 

    after(:all) do
      @user.delete
    end
  end
end
