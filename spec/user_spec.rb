require 'spec_helper'

describe User do
  let(:valid_user){ User.new(name: "Andy", email: "user@email.com", password: "password", password_confirmation: "password") }
  let(:invalid_user){ User.new(name: "Andy", email: "user@email.com", password: "blah", password_confirmation: "something") }
  describe "User Creation" do
    it "can be created when password and password_confirmation match" do
      expect{ valid_user.save }.to change{ User.count }.by 1
    end

    it "cannot be created when password and password_confirmation do not match" do
      expect{ invalid_user.save }.to change{ User.count }.by 0
    end

    it "cannot be created without a password or password_confirmation" do
      expect{ User.create(name: "Andy", email: "user@email.com", password: '', password_confirmation: "password") }.to change{ User.count }.by 0
      expect{ User.create(name: "Andy", email: "user@email.com", password: "password", password_confirmation: '') }.to change{ User.count }.by 0
    end

    it{ should validate_presence_of :password_digest }
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
  end

  describe "User Authentication" do
    before(:each){ valid_user.save }
    it "authenticates with correct password" do
      expect(valid_user.authenticate("password")).to be valid_user
    end

    it "does not authenticate with incorrect password" do
      expect(valid_user.authenticate("incorrect_password")).to eq false
    end
  end
end