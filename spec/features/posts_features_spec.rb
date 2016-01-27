require 'spec_helper'

feature "Displaying Posts" do

  context 'Posts page' do
    before :each do
      Post.create title: "Title1", body: "Content1"
      Post.create title: "Title2", body: "Content2"
      visit '/posts'
    end

    it "can see posts on posts page" do
      expect(page).to have_content("Title1")
      expect(page).to have_content("Content1")
      expect(page).to have_content("Title2")
      expect(page).to have_content("Content2")
    end
  end

  context 'Post Show page' do
    let(:post){ Post.create title: 'Lazy-loaded Post', body: 'Body' }
    before(:each){ visit "/posts/show/#{post.id}" }

    it "Post is displayed" do
      expect(page).to have_content "Lazy-loaded Post"
      expect(page).to have_content "Body"
    end
  end
end