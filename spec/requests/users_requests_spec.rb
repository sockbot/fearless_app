require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users/new" do
    it "renders the sign up template" do
      get new_user_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Sign Up")
    end 
  end

end