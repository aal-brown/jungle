require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  require 'rails_helper'

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add an item to the cart and go to the cart page, it should show the right product" do

    visit root_path

    
    # This finds the first element 
    within all(".product")[0] do
      click_on "Add"
    end
    save_screenshot

    expect(page).to have_content("My Cart (1)")

    find("a[href='/cart']").click

    sleep(1)
    save_screenshot

    expect(page).to have_css(".cart-show")
  end
end
