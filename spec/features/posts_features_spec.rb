require 'spec_helper'

describe "Displaying Posts" do
  it "can see posts on posts page" do
    Post.create(title: "Title", body: "Content")
    visit '/posts'
    expect(page).to have_content("Title")
    expect(page).to have_content("Content")
  end
end