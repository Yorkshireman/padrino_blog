require 'spec_helper'

describe "User Features" do
  
  context "Signing Up" do
    before :each do
      visit '/'
      click_on 'Sign Up'
    end
    
    it "can sign up with name, email, and matching password and password_confirmation" do
      expect(current_path).to eq '/users/new'
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_on 'Sign Up'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Signed up successfully!'
      expect(page).to_not have_content 'Sign Up'
      expect(page).to have_content 'Log out'
    end

    xit "cannot sign up without a password"
    xit "cannot sign up without password_confirmation"
    xit "cannot sign up if password and password_confirmation do not match"
    xit "cannot sign up without a name"
    xit "cannot sign up without an email"
  end

  context "Logging in" do
    xit "can login with valid details"
    xit "cannot login with invalid details"
    xit "cannot login with no details whatsoever"
  end
end