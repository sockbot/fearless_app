require 'rails_helper'

RSpec.describe "Session", type: :request do
  
  describe "GET /sessions/new" do
    it "renders the login template" do
      get new_session_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Log In")
    end 
  end

  describe "POST /sessions" do
    it "creates a new session with valid email and password" do
      user = User.new(email: "hello@world.com", password: "Password1!")
      post sessions_url, params: {user: {email: "hello@world.com", password: "Password1!"}}
      expect(session[:user_id]).to eq(user.id)
    end
  end
end
