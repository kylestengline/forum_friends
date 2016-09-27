require 'rails_helper'

RSpec.feature "User Sign In" do

  before do 
    @jon = User.create(email: "jon@example.com", password: "password")
  end
  
  scenario "A user can sign in" do
    
    visit "/"

    click_link "Sign In"

    fill_in "Email", with: @jon.email
    fill_in "Password", with: @jon.password

    click_button "Sign In"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Welcome, #{@jon.email}")
    expect(current_path).to eq root_path

  end

  scenario "A user cannont sign in" do
    visit "/"

    click_link "Sign In"

    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button "Sign In"

    expect(page).to have_content("Invalid Email or password.")
    expect(current_path).to eq new_user_session_path
  end
end

