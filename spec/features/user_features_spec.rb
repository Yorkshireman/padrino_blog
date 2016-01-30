require 'spec_helper'

describe "User Features" do
  context "when not signed in" do
    before(:each){ visit '/' }

    it "'Logout' is not visible" do
      expect(page).to_not have_content "Logout"
    end

    it "'Login' is visible" do
      expect(page).to have_content "Login"
    end
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
      click_button 'Sign Up'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Signed up successfully! Please Log in'
    end

    it "cannot sign up without a password" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Please make sure you fill in all fields."
    end
    
    it "cannot sign up without password_confirmation" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Please make sure you fill in all fields."
    end

    it "cannot sign up if password and password_confirmation do not match" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "passwor"
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to have_content "Password and Password Confirmation do not match. Please try again."
    end

    it "cannot sign up without a name" do
      fill_in 'user[email]', with: "user@email.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to_not have_content "Signed up successfully! Please Log in"
      expect(page).to have_content "Please make sure you fill in all fields."      
    end

    it "cannot sign up without an email" do
      fill_in 'user[name]', with: "Andy"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button 'Sign Up'
      expect(current_path).to eq '/users/new'
      expect(page).to_not have_content "Signed up successfully! Please Log in"
      expect(page).to have_content "Please make sure you fill in all fields."      
    end
  end
end