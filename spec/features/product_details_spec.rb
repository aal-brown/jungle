require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
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

  scenario "They click on a product and it brings up the details page for that product" do

    visit root_path

    # This finds the first element 
    within all(".product")[0] do
      find('img').click
    end

    sleep(1)
    save_screenshot

    expect(page).to have_css(".products-show")
  end
end
