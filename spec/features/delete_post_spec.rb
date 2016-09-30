require 'rails_helper'

RSpec.feature "Delete Post" do
  
  before do
    @joe = User.create!(email: "joe@example.com", password: "password")
    login_as(@joe)

    @post = Post.create!(title: "Title of Post", content: "The Content of my post", user: @joe)
  end

  scenario "A valid user can delete his own post" do
    visit "/"

    click_link @post.title
    click_button "Delete Post"

    expect(current_path).to eq(posts_path)
    expect(page).to have_content("Post has been deleted")
  end
end
