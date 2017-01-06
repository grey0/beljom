require 'rails_helper'

feature 'Any user can sign up as a seller' do
  scenario 'visiting the homepage there should be a sign up link that leads to a form' do
    visit root_path

    find_link('Seller sign up').visible?
    click_on 'Seller sign up'
    expect(page).to have_content('Name')
    expect(page).to have_content('Email')
    expect(page).to have_content('Phone number')
    expect(page).to have_content('Whatsapp')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
  end

  scenario 'user can sign up with new seller form with matching password' do
    visit root_path

    find_link('Seller sign up').visible?

    click_on 'Seller sign up'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'johndoe@beljom.sl'
    fill_in 'Phone number', with: '23225500500'
    fill_in 'Password', with: '1234567beljom'
    fill_in 'Password confirmation', with: '1234567beljom'

    click_on 'Create Seller'
    expect(page).to have_content('Seller was successfully created.')
  end

  scenario 'user is redirect to signup form if password does not match' do
    visit root_path

    find_link('Seller sign up').visible?

    click_on 'Seller sign up'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'johndoe@beljom.sl'
    fill_in 'Phone number', with: '23225500500'
    fill_in 'Password', with: '1234567beljom'
    fill_in 'Password confirmation', with: '12345673beljom'

    click_on 'Create Seller'
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  scenario 'once a seller is created and approved they can view products that they have listed' do
    visit root_path

    find_link('Seller sign up').visible?

    click_on 'Seller sign up'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'johndoe@beljom.sl'
    fill_in 'Phone number', with: '23225500500'
    fill_in 'Password', with: '1234567beljom'
    fill_in 'Password confirmation', with: '1234567beljom'

    click_on 'Create Seller'

    click_on 'Log In'

    fill_in 'Email', with: 'johndoe@beljom.sl'
    fill_in 'Password', with: '1234567beljom'

    create(:product, seller_id: Seller.last.id)

    click_on 'Log In'

    click_on 'Me Markit'
    expect(page).to have_content('Product 1')
  end
end