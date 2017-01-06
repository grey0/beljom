require 'rails_helper'

feature 'Any user can sign up as a seller' do

  scenario 'visiting the homepage there should be a sign up link that leads to a form' do
    create(:category)
    create(:seller)
    create(:product, seller_id: Seller.last.id, category_id: Category.last.id)

    visit root_path

    click_on 'Log In'

    fill_in 'Email', with: 'johndoe@beljom.sl'
    fill_in 'Password', with: '1234567beljom'

    click_on 'Log In'

    click_on 'Me Markit'
    expect(page).to have_content('Product 1')

    visit root_path

    expect(page).to have_content('Log Out')

    click_on 'Log Out'

    expect(page).to have_content('Log In')
  end
end