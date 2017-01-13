class ImagesController < ApplicationController

  before_action :set_product

  def fetch_item
    # binding.pry

    # render

    respond_to do |format|
      format.js
    end
  end

  def from_category
    remain_images = @product.product_images # copy the array
    deleted_image = remain_images.delete_at(params[:id].to_i) # delete the target image
    deleted_image.try(:remove!) # delete image
    @product.product_images = remain_images
    flash[:error] = "Failed deleting image" unless @product.save
    respond_to do |format|
      format.js
    end
  end

  private
  def set_product
    @product = Product.find_by(id: params[:product_id])
  end
end