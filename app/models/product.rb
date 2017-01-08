class Product < ApplicationRecord
  validates :name, :description, presence: true
  validate :image_count
  mount_uploaders :product_images, ProductImageUploader

  def image_count
    if product_images.count > 5
      errors.add(:product_images, 'you cannot upload more than 5 files')
    end
  end
end
