class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: String
  field :category_id, type: Integer

  embeds_many :reviews

  validates :name, :description, presence: true
end
