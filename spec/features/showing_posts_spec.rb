require 'rails_helper'

RSpec.feature "Showing Posts" do
  
  before do
    @joe = User.create(email: "joe@example.com", password: "password")

    @post = Post.create(title: "Title of Post", content: "The Content of my post", user: @joe)
  end
  scenario "It shows all posts" do
    visit "/"

    expect(page).to have_link(@post.title)
    expect(page).to have_content(@post.content)
  end

end
