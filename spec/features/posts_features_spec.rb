require 'spec_helper'
require_relative '../support/spec_helper_methods'

feature "Post Features" do
  include SpecHelperMethods
  let(:user){ User.create(name: "Andy", email: "user@email.com", password: "password", password_confirmation: "password") }
  
  describe "Creating Posts" do
    it "Can create a post" do
      visit '/'
      click_link "Sign Up"
      fill_in 'user[name]', with: "Bob"
      fill_in 'user[email]', with: "bob@email.com"
      fill_in 'user[password]', with: "password"
      fill_in 'user[password_confirmation]', with: "password"
      click_button 'Sign Up'
      fill_in 'email', with: "bob@email.com"
      fill_in 'password', with: "password"
      click_button 'Login'      
      expect(page).to have_content "Successfully signed in!"
      click_on "Create Post"
      fill_in 'post[title]', with: "Title99"
      fill_in 'post[body]', with: "Body99"
      click_button "Post"
      expect(page).to have_content "Post Posted!"
      expect(page).to have_current_path('/posts')
      expect(page).to have_content "Title99"
      expect(page).to have_content "Body99"
      expect(page).to have_content "Bob"
    end
  end

  describe 'Post Show page' do
    let(:post){ Post.create title: 'Lazy-loaded Post', body: 'Body', user: user }
    before(:each){ visit "/posts/show/#{post.id}" }

    it "Post's title, body, and author are displayed" do
      expect(page).to have_content "#{post.title}"
      expect(page).to have_content "#{post.body}"
      expect(page).to have_content "#{post.user.name}"
    end
  end
end