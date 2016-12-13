class ProductsController < ApplicationController
  def create
    @product = Product.new(product_param)

    if @product.save
      redirect_to seller_path(session[:seller_id]), notice: "Item was successfully added"
    else
      render :new
    end
  end

  def update
    @product = Product.update(product_param)

    if @product
      redirect_to seller_path(session[:seller_id]), notice: "Item was successfully update"
    else
      render :new
    end
  end

  def new
    @product = Product.new()
    # @categories_arry = Category.all.map{|e| [e.name, e.id]}
  end

  def index
    @products = Product.where(category_id: params[:category_id])
  end

  def show
    @product = Product.find(id: params[:id])
  end

  def edit
    @product = Product.find(id: params[:id])
  end


  def destroy
    @product = Product.find(id: params[:id])
    @product.destroy
    redirect_to seller_path(session[:seller_id]), notice: "Successfully delete item"
  end

  def product_param
    params.require(:product).permit(:name, :description, :category_id, :seller_id)
  end
end
