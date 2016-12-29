require 'rails_helper'

feature 'any user can view all items of a category' do
  scenario 'they see the word category in the homepage' do
    create :category
    create :product, category_id: Category.last.id
    create :product, name: 'Product 2', description: 'Description for product 2', category_id: Category.last.id

    visit "/categories/#{Category.last.id}"

    page.should have_content('Test Category')
    find_link('Product 1').visible?
    find_link('Product 2').visible?
  end
end