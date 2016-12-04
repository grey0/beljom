class ProductsController < ApplicationController
  def create
  end

  def new
  end

  def index
    @products = Product.where(category_id: params[:category_id])
  end
end
