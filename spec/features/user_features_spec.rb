require 'spec_helper'

describe "User Features" do
  describe "Signing Up" do
    xit "can sign up with name, email, and matching password and password_confirmation"
    xit "cannot sign up without a password"
    xit "cannot sign up without password_confirmation"
    xit "cannot sign up if password and password_confirmation do not match"
    xit "cannot sign up without a name"
    xit "cannot sign up without an email"
  end

  describe "Logging in" do
    xit "can login with valid details"
    xit "cannot login with invalid details"
    xit "cannot login with no details whatsoever"
  end
end