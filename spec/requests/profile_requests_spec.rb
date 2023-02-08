require 'rails_helper'

RSpec.describe "Profile", type: :request do

  describe "GET /users/:user_id/profile/new" do
    it "renders the new profile template" do
      @user = User.new(email: "asdf@asdf.com", password: "Password1!")
      get new_user_profile_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Create Profile")
    end 

  end

  # describe "POST /users" do
  #   it "can create a new user with unique email and password" do
  #     expect {post users_url, params: {user: {email: "hello@world.com", password: "Password1!"}}}.to change(User, :count).by(1)
  #     expect(response).to have_http_status(302)
  #     expect(response).to redirect_to root_path

  #     follow_redirect!

  #     expect(flash[:notice]).to include("Account created successfully!")
  #   end

  #   it "does not create a user with duplicate email and password" do
  #     user = User.new(email: "hello@world.com", password: "Password1!")
  #     user.save
  #     expect {post users_url, params: {user: {email: "hello@world.com", password: "Password1!"}}}.to change(User, :count).by(0)
  #     expect(response).to have_http_status(422)
  #     expect(flash[:alert]).to include("Couldn't create account. Try again")
  #   end
  # end
end
