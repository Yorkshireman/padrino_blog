require 'spec_helper'
require_relative '../support/spec_helper_methods'

feature "Sessions Features" do
  include SpecHelperMethods
  let(:user){ User.create(name: "Andy", email: "user@email.com", password: "password", password_confirmation: "password") }
  
  describe "Signing in" do
    before :each do
      visit '/'
      click_on 'Login'
    end

    it "can sign in with valid information" do
      login user
      expect(current_path).to eq '/'
      expect(page).to have_content "Successfully signed in!"
      expect(page).to_not have_content 'Login'
      expect(page).to have_content 'Logout'
    end

    it "cannot sign in with invalid email" do
      fill_in 'email', with: "invalid@email.com"
      fill_in 'password', with: "password"
      click_button 'Login'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "One or more errors prevented you from logging-in"
    end

    it "cannot sign in with invalid password" do
      fill_in 'email', with: "#{user.email}"
      fill_in 'password', with: "invalidpassword"
      click_button 'Login'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "One or more errors prevented you from logging-in"
    end
  end

  describe "Signing Out" do
    it "can sign out" do
      visit '/'
      click_on 'Login'
      login user
      click_on 'Logout'
      expect(page).to have_content "Logged out successfully"
      expect(page).to have_content "Login"
      expect(page).to have_content "Sign Up"
      expect(page).to_not have_content "Logout"
    end
  end
end