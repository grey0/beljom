class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :rating, type: String
  field :category_id, type: Integer
  field :seller_id, type: Integer
  field :approved, type: Boolean, default: false
  field :approved_by, type: Integer

  embeds_many :reviews

  def seller
    Seller.find_by(id: seller_id)
  end

  validates :name, :description, presence: true
  attr_accessor :product_image, :product_image_cache

  mount_uploader :product_image, ProductImageUploader
end
