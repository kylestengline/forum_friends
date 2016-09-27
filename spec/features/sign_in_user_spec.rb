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
    expect(page).to have_content("Welcome #{@jon.email}")

  end
end

