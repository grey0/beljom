class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :price, presence: true
  validate :image_count
  validate :price_is_not_neg

  enum currency: [:le, :usd]
  enum condition: [:neww, :used]


  belongs_to :seller

  mount_uploaders :product_images, ProductImageUploader

  def cond
    if neww?
      'New'
    else
      condition.try(:capitalize)
    end
  end

  def unit
    case currency
     when 'le'
       'Le '
     when 'usd'
       '$ '
    end
  end

  private
  def price_is_not_neg
    if price && price < 0
      errors.add(:price, 'price cannot be negative')
    end
  end

  def image_count
    if product_images.count > 10
      errors.add(:product_images, 'you cannot upload more than 10 files')
    end
  end
end
