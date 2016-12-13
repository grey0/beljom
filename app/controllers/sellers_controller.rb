class SellersController < ApplicationController
  def create
    @seller = Seller.new(seller_param)

    if @seller.save
      redirect_to categories_path, notice: 'Seller was successfully created.'
    else
      render :new
    end
  end

  def new
    @seller = Seller.new
  end

  def index
  end


  def seller_param
    params.require(:seller).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end
end
