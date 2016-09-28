require 'rails_helper'

RSpec.feature "Creating Posts" do
  
  before do 
    @joe = User.create!(email: "joe@example.com", password: "wonders")
    login_as(@joe)
  end

  scenario "A valid user can create a post" do
    
    click_link "Add New Post"
    fill_in "Title", with: "Title"
    fill_in "Content", with: "The content of my post"
    click_button "Create Post"

    expect(page).to have_content("Post Created!")
    expect(current_path).to eq root_path
    expect(page).to have_content("Created by: #{@joe.email}")

  end
end
