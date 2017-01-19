class ProductsController < ApplicationController

  def create
    prod_param = product_param
    prod_param[:currency], prod_param[:condition] = prod_param[:currency].to_i, prod_param[:condition].to_i
    @product = Product.new(prod_param)

    if @product.save
      flash[:info] = "Item was successfully added"
      redirect_to seller_path(session[:seller_id])
    else
      render :new
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    current_images = @product.product_images
    edit_params = product_param
    edit_params[:currency], edit_params[:condition] = edit_params[:currency].to_i, edit_params[:condition].to_i
    if edit_params[:product_images]
      edit_params[:product_images] += current_images
    end
    @product.update(edit_params)
    if @product && params[:admin] == 'true'
      redirect_to admins_dashboard_path
    elsif @product
      flash[:info] = 'Item was successfully update'
      redirect_to seller_path(session[:seller_id])
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
    @product.remove_product_images!
    @product.save
    @product.reload
    @product.destroy
    flash[:info] = "Successfully delete item"
    redirect_to seller_path(session[:seller_id])
  end

  def product_param
    params.require(:product).permit(:name, :description, :category_id, :seller_id, {product_images: []}, :price, :currency, :condition)
  end
end
