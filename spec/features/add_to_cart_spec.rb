require 'rails_helper'

RSpec.feature "User can click the Add To Cart button", type: :feature, js: true do
  
  #SETUP
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

  scenario "They add the product to their cart and they should see My Cart(0) changes to  My Cart(1) " do
    # ACT
    visit root_path
      
    find('button', text: 'Add', :match => :first).click
    # DEBUG / VERIFY
    sleep 4
    puts page.html
    save_screenshot

    expect(page).to have_content 'My Cart (1)' 
  end


end
