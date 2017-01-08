class Product < ApplicationRecord
  validates :name, :description, presence: true

  mount_uploaders :product_images, ProductImageUploader
end
