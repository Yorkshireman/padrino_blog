require 'spec_helper'

describe "User Features" do
  context "when not signed in" do
    before(:each){ visit '/' }

    xit "'Log out' is not visible"
    xit "'Log in' is visible"
    xit "'Log out' is not visible"
  end
  
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
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Signed up successfully! Please Log in'
    end

    it "cannot sign up without a password" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      click_on 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Please make sure you fill in all fields."
    end
    
    it "cannot sign up without password_confirmation" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      click_on 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Please make sure you fill in all fields."
    end

    it "cannot sign up if password and password_confirmation do not match" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "passwor"
      click_on 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Password and Password Confirmation do not match. Please try again."
    end

    xit "cannot sign up without a name"
    xit "cannot sign up without an email"
  end
end