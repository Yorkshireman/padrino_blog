require 'spec_helper'

feature "Creating Posts" do
  let(:user){ User.create(email: "user@email.com", password: "password", password_confirmation: "password") }

  it "Can create a post" do
    visit '/sessions/new'
    login(user)
    visit '/posts/new'
    fill_in 'title', with: "Title 1"
    fill_in 'body', with: "Body"
    click_on "Post"
    expect(current_path).to eq '/posts'
    expect(page).to have_content "Title 1"
    expect(page).to have_content "Body"
  end

  def login(user)
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "password"
    click_on 'Login'
  end
end

feature "Displaying Posts" do

  context 'Posts page' do
    before :each do
      @post1 = Post.create title: "Title1", body: "Content1"
      @post2 = Post.create title: "Title2", body: "Content2"
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
    let(:post){ Post.create title: 'Lazy-loaded Post', body: 'Body' }
    before(:each){ visit "/posts/show/#{post.id}" }

    it "Post's title is displayed" do
      expect(page).to have_content "#{post.title}"
    end

    it "Post's body is displayed" do
      expect(page).to have_content "#{post.body}"
    end

    it "Post's account's email is displayed" do
      expect(page).to have_content "#{post.account.email}"
    end
  end
end