class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: String
  field :category_id, type: Integer
  field :seller_id, type: Integer
  field :approved, type: Boolean, default: false
  field :approved_by, type: String

  embeds_many :reviews

  # belongs_to :seller

  validates :name, :description, presence: true
end
