require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before(:all) do
    User.create({first_name: "Isaac", last_name: "Smith", email: "ismith@test.com", password: "password", password_confirmation: "password" })
  end
  
  scenario "They they click on login and it goes to the login page, then they enter login credentials and successfully login" do
    visit root_path

  find("a[href='/login']").click
  
  expect(page).to have_field("password")

  sleep(1)

  save_screenshot
  
  fill_in "email", with: "ismith@test.com"
  fill_in "password", with: "password"

  save_screenshot
  
  click_on "Submit"

  save_screenshot

  expect(page).to have_content("Isaac Smith")

  end

end
