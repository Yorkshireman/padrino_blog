require 'spec_helper'

describe "Displaying Posts" do
  context 'Posts page' do
    before :each do
      Post.create(title: "Title1", body: "Content1")
      Post.create(title: "Title2", body: "Content2")
    end

    it "can see posts on posts page" do
      visit '/posts'
      expect(page).to have_content("Title1")
      expect(page).to have_content("Content1")
      expect(page).to have_content("Title2")
      expect(page).to have_content("Content2")
    end
  end
end