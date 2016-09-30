require 'rails_helper'

RSpec.feature "Editing Post" do

  before do
    @joe = User.create(email: "joe@example.com", password: "password")
    login_as(@joe)

    @post = Post.create(title: "Title of Post", content: "The Content of my post", user: @joe)
  end

  scenario "Valid user can edit a post" do
    visit "/"

    click_link(@post.title)

    click_button "Edit Post"

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.content)

    click_button "Update Post"

    expect(page).to have_content("Post Updated")
    expect(current_path).to eq(post_path(@post))
  end
end
