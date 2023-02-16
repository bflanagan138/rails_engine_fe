require 'rails_helper'

RSpec.describe 'merchants index' do
  it 'displays a list of merchant names' do
    visit merchants_path

    expect(page).to have_content('Merchants')
    expect(page).to have_content('Willms and Sons')
  end

  it 'takes me to a merchants index page when I click their name' do
    visit merchants_path

    click_link "Willms and Sons"
    expect(current_path).to be merchant_path(merchant)
    expect(page).to have_content("Willms and Sons")
    expect(page).to have_content('Item Enim Error')
  end
end

# As a visitor,
# When I visit '/merchants'
# I should see a list of merchants by name
# and when I click the merchant's name
# I should be on page '/merchants/:id'
# And I should see a list of items that merchant sells.