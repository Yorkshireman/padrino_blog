require 'spec_helper'
require_relative '../support/spec_helper_methods'

feature "Post Features" do
  include SpecHelperMethods
  let(:user){ User.create(email: "user@email.com", password: "password", password_confirmation: "password") }
  
  describe "Creating Posts" do
    it "Can create a post" do
      visit '/sessions/new'
      login user
      click_on "Create Post"
      fill_in 'post[title]', with: "Title 1"
      fill_in 'post[body]', with: "Body"
      click_on "Post"
      expect(current_path).to eq '/posts'
      expect(page).to have_content "Title 1"
      expect(page).to have_content "Body"
      expect(page).to have_content "Post Posted!"
    end
  end

  describe "Displaying Posts" do
    context 'Posts page' do
      before :each do
        @post1 = Post.create title: "Title1", body: "Content1", user: user
        @post2 = Post.create title: "Title2", body: "Content2", user: user
        visit '/posts'
      end

      it "can see posts' titles" do
        expect(page).to have_content("#{@post1.title}")
        expect(page).to have_content("#{@post2.title}")
      end

      it "can see posts' bodies" do
        expect(page).to have_content("#{@post1.body}")
        expect(page).to have_content("#{@post2.body}")
      end

      it "can see posts' authors" do
        expect(page).to have_content("#{@post1.user.name}")
        expect(page).to have_content("#{@post2.user.name}")
      end
    end

    context 'Post Show page' do
      let(:post){ Post.create title: 'Lazy-loaded Post', body: 'Body', user: user }
      before(:each){ visit "/posts/show/#{post.id}" }

      it "Post's title is displayed" do
        expect(page).to have_content "#{post.title}"
      end

      it "Post's body is displayed" do
        expect(page).to have_content "#{post.body}"
      end

      it "Author's name is displayed" do
        expect(page).to have_content "#{post.user.name}"
      end
    end
  end
end