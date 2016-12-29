require 'rails_helper'

feature 'Any user can view all categories without logging in' do
  scenario 'they see the word category in the homepage' do
    visit root_path

    page.should have_content('Categories')
    find_link('Log In').visible?
    find_link('Seller sign up').visible?
  end
end