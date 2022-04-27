require 'rails_helper'

RSpec.describe 'merchant bulk discount index' do
  it 'shows percentage_discount and quantity for each bulk discount' do
    merchant_1 = Merchant.create(name: "Drew's")
    merchant_2 = Merchant.create(name: "Geddy's")

    bulk_discount_1 = merchant_1.bulk_discounts.create(percentage_discount: 20, quantity_threshold:15  )
    bulk_discount_2 = merchant_1.bulk_discounts.create(percentage_discount: 30, quantity_threshold:25  )
    bulk_discount_3 = merchant_2.bulk_discounts.create(percentage_discount: 10, quantity_threshold:22  )

    visit "/merchants/#{merchant_1.id}/bulk_discounts"

    within"#bulk_discounts" do
      expect(page).to have_content('20%')
      expect(page).to have_content('30%')
      expect(page).to have_content('15')
      expect(page).to have_content('25')
      expect(page).to_not have_content('10%')
      expect(page).to_not have_content('22')
    end
  end

  it 'links to new bulk discount' do
    merchant_1 = Merchant.create(name: "Drew's")
    merchant_2 = Merchant.create(name: "Geddy's")

    bulk_discount_1 = merchant_1.bulk_discounts.create(percentage_discount: 20, quantity_threshold:15  )
    bulk_discount_2 = merchant_1.bulk_discounts.create(percentage_discount: 30, quantity_threshold:25  )
    bulk_discount_3 = merchant_2.bulk_discounts.create(percentage_discount: 10, quantity_threshold:22  )

    visit "/merchants/#{merchant_1.id}/bulk_discounts"
    click_link("Create a New Discount")

    expect(page).to have_current_path("/merchants/#{merchant_1.id}/bulk_discounts/new")
  end

  it 'links to new bulk discount' do
    merchant_1 = Merchant.create(name: "Drew's")
    merchant_2 = Merchant.create(name: "Geddy's")

    bulk_discount_1 = merchant_1.bulk_discounts.create(percentage_discount: 20, quantity_threshold:15  )
    bulk_discount_2 = merchant_1.bulk_discounts.create(percentage_discount: 30, quantity_threshold:25  )
    bulk_discount_3 = merchant_2.bulk_discounts.create(percentage_discount: 10, quantity_threshold:22  )

    visit "/merchants/#{merchant_1.id}/bulk_discounts"
    click_button("Delete", :match => :first)

    expect(page).to have_current_path("/merchants/#{merchant_1.id}/bulk_discounts")
    expect(page).to_not have_content("20%")
    expect(page).to_not have_content("15")
    expect(page).to have_content("30%")
    expect(page).to have_content("25")
  end

  it 'next 3 holidays and dates' do
    merchant_1 = Merchant.create(name: "Drew's")
    merchant_2 = Merchant.create(name: "Geddy's")

    bulk_discount_1 = merchant_1.bulk_discounts.create(percentage_discount: 20, quantity_threshold:15  )
    bulk_discount_2 = merchant_1.bulk_discounts.create(percentage_discount: 30, quantity_threshold:25  )
    bulk_discount_3 = merchant_2.bulk_discounts.create(percentage_discount: 10, quantity_threshold:22  )
       visit "/merchants/#{merchant_1.id}/bulk_discounts"
           expect(page).to have_content("Memorial Day")
           expect(page).to have_content("2022-05-30")
           expect(page).to have_content("Juneteenth")
           expect(page).to have_content("2022-06-20")
           expect(page).to have_content("Independence Day")
           expect(page).to have_content("2022-07-04")
     end
end
