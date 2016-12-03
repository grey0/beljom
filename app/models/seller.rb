class Seller < ApplicationRecord
  validates :name, :phone_number, :email, presence: true
  validates :email, format: { with: /\A.+@.+\z/}, uniqueness: true
end
