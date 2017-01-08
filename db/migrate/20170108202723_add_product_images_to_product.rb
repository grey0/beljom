class AddProductImagesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_images, :string, array: true, default: [] # add images column as array
  end
end
