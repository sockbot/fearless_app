require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "model validity" do
    it "is not valid without a user FK" do
      profile = Profile.new()
      profile.user = nil
      expect(profile).to_not be_valid
    end

    it "is valid with a user FK and no other values" do
      profile = Profile.new()
      user = User.new()
      profile.user = user
      expect(profile).to be_valid
    end

    it "is valid with alphanumeric strings for name and handle" do
      profile = Profile.new(name: "Leeroy Jenkins99", handle: "bbq master11!!!")
      user = User.new()
      profile.user = user
      expect(profile).to be_valid
    end

    it "should validate an integer icq" do
      profile = Profile.new(icq: 12345)
      user = User.new()
      profile.user = user
      expect(profile.icq).to be(12345)
    end

    it "should not validate a non-integer icq" do
      profile = Profile.new(icq: "12345")
      user = User.new()
      profile.user = user
      expect(profile.icq).to be(nil)
    end
  end

end