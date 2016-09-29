require 'rails_helper'

RSpec.feature "Showing Posts" do
  
  before do
    @joe = User.create(email: "joe@example.com", password: "password")

    @post = Post.create(title: "Title of Post", content: "The Content of my post", user: @joe)
  end
  scenario "It shows all posts" do
    visit "/"

    click_link @post.title

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.content)
    expect(current_path).to eq(post_path(@post))
  
  end
end
