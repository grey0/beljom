class SellersController < ApplicationController
  def create
    @seller = Seller.new(seller_param)

    if @seller.save
      @seller.update(activated: true)
      # SellerMailer.account_activation(@seller).deliver_now
      # flash[:info] = "Please check your email to activate your account."
      # redirect_to root_url
      # redirect_to categories_path, notice: 'Please check your email to activate your account.'
      flash[:info] = 'Seller was successfully created.'
      redirect_to categories_path
    else
      render :new
    end
  end

  def new
    @seller = Seller.new
  end

  def index
  end

  def show
    @seller = Seller.find(params[:id])
    @products = Product.where(seller_id: @seller.id)
  end


  def seller_param
    params.require(:seller).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end
end
