require 'rails_helper'

RSpec.feature "Adding comments" do

  before do
    @joe = User.create(email: "joe@example.com", password: "password")
    @jeff = User.create(email: "jeff@example.com", password: "password")

    @post = Post.create(title: "My post", content: "The content of my post", user: @joe)
  end

  scenario "signed in users can leave comments" do
    login_as(@jeff)

    visit "/"

    click_link @post.title
    fill_in "New Comment", with: "Great Post!"
    click_button "Submit Comment"

    expect(page).to have_content("Comment created!")
    expect(current_path).to eq(post_path(@post.comments.last.id))
  end
end


