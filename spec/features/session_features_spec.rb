require 'spec_helper'

feature "Sessions Features" do
  let(:user){ User.create(email: "user@email.com", password: "password", password_confirmation: "password") }
  
  describe "Signing in" do
    before :each do
      visit '/'
      click_on 'Login'
    end

    it "can sign in with valid information" do
      fill_in 'email', with: "#{user.email}"
      fill_in 'password', with: "password"
      click_on 'Login'
      expect(current_path).to eq '/'
      expect(page).to have_content "Successfully signed in!"
      expect(page).to_not have_content 'Login'
      expect(page).to have_content 'Logout'
    end

    it "cannot sign in with invalid email" do
      fill_in 'email', with: "invalid@email.com"
      fill_in 'password', with: "password"
      click_on 'Login'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "One or more errors prevented you from logging-in"
    end

    it "cannot sign in with invalid password" do
      fill_in 'email', with: "#{user.email}"
      fill_in 'password', with: "invalidpassword"
      click_on 'Login'
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "One or more errors prevented you from logging-in"
    end
  end
end