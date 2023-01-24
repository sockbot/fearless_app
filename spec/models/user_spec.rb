require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "is not valid without an email" do
    it "has no email" do
      user = User.new()
      expect(user).to_not be_valid
    end
    it "has an email of nil" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
  end

  it "is valid with an email" do
    user = User.new(email: "asdf@asdf.com")
    expect(user).to be_valid
  end

end
