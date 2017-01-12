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
    @product = Product.find_by(id: params[:id])
    @product.update(product_param)
    if @product && params[:admin] == 'true'
      redirect_to admins_dashboard_path
    elsif @product
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
    @product = Product.find_by(id: params[:id])
    @seller = @product.seller
  end

  def edit
    @admin = params[:admin]
    @product = Product.find_by(id: params[:id])
  end

  def approve
    product = Product.find_by(id: params[:product_id])
    product.update(approved: true, approved_by: session[:admin_id])
    redirect_to admins_dashboard_path
  end


  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to seller_path(session[:seller_id]), notice: "Successfully delete item"
  end

  def product_param
    params.require(:product).permit(:name, :description, :category_id, :seller_id, {product_images: []}, :price)
  end
end
