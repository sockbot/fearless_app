require 'rails_helper'

RSpec.describe "Session", type: :request do
  
  describe "GET /login" do
    it "renders the login template" do
      get login_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Log In")
    end 
  end

  describe "POST /sessions" do
    before(:all) do
      @user = User.new(email: "hello@world.com", password: "Password1!")
    end

    it "creates a new session with valid email and password" do
      post sessions_path, params: {user: {email: "hello@world.com", password: "Password1!"}}
      expect(session[:user_id]).to eq(@user.id)
    end

    it "fails to create a new session with invalid email" do
      post sessions_path, params: {user: {email: "notanemail", password: "Password1!"}}
      expect(session[:user_id]).to eq(nil)
    end

    it "fails to create a new session with invalid password" do
      post sessions_path, params: {user: {email: "hello@world.com", password: nil}}
      expect(session[:user_id]).to eq(nil)
    end
  end

  describe "DELETE /logout" do
    before(:each) do
      user_params = { email: "hello@world.com", password: "Password1!" }
      @user = User.new(user_params)
      @user.save
      post sessions_path, params: user_params 
    end

    it "destroys a session" do
      expect(session[:user_id]).to eq(@user.id)
      delete logout_path
      expect(session[:user_id]).to eq(nil)
    end

    after(:each) do
      @user.delete
    end
  end
end
