require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "is not valid without both email and password_digest" do
    it "has no email" do
      user = User.new()
      expect(user).to_not be_valid
    end
    it "has an email of nil" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
    it "has an email of nil with a password_digest" do
      user = User.new(email: nil, password_digest: "Password1!")
      expect(user).to_not be_valid
    end
    it "is not valid with an email but without a password_digest" do
      user = User.new(email: "asdf@asdf.com")
      expect(user).to_not be_valid
    end
    it "has an email with a password_digest of nil" do
      user = User.new(email: "email", password_digest: nil)
      expect(user).to_not be_valid
    end
  end

  it "is valid with an email and password" do
    user = User.new(email: "asdf@asdf.com", password_digest: "Password1!")
    expect(user).to be_valid
  end

end
