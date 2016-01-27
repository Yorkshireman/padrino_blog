require 'spec_helper'

describe User do
  it "can be created when password and password_confirmation match" do
    valid_user = User.new(name: "Andy", email: "user@email.com", password: "password", password_confirmation: "password")
    expect{ valid_user.save }.to change{ User.count }.by 1
  end

  it "cannot be created when password and password_confirmation do not match" do
    invalid_user = User.new(name: "Andy", email: "user@email.com", password: "blah", password_confirmation: "something")
    expect{ invalid_user.save }.to change{ User.count }.by 0
  end

  it "cannot be created without a password or password_confirmation" do
    expect{ User.create(name: "Andy", email: "user@email.com", password: '', password_confirmation: "password") }.to change{ User.count }.by 0
    expect{ User.create(name: "Andy", email: "user@email.com", password: "password", password_confirmation: '') }.to change{ User.count }.by 0
  end

  it{ should validate_presence_of :password_digest }
end