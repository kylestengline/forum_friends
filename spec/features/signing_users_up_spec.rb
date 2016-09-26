require 'rails_helper'

RSpec.feature "User Signup" do

  scenario "A user can sign up" do
    
    visit "/"

    click_link "Sign Up"

    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign Up"

    expect(current_path).to eq root_path
  end
end
