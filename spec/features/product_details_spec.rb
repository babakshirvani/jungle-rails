require 'rails_helper'

RSpec.feature "Visitor navigate to Product Details page", type: :feature, js: true do

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

  scenario "They see the product details" do
    # ACT
    visit root_path
      
    find_link('Details', :match => :first).click
    # DEBUG / VERIFY
    sleep 6
    puts page.html
    save_screenshot

    expect(page).to have_content 'Quantity' 
  end

  

end
