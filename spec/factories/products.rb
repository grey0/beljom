FactoryGirl.define do
  factory :product do
    name "Product 1"
    description "Description for product 1"
    category_id 1
    seller_id 1
    approved true
    approved_by 1
  end
end