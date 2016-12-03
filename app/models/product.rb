class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: String
  field :reviews, type: String

  validates :name, :description, presence: true
end
