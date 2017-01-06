class PasswordResetsController < ApplicationController
  before_action :get_seller,   only: [:edit, :update]
  before_action :valid_seller, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    @seller = Seller.find_by(email: params[:password_reset][:email].downcase)
    if @seller
      @seller.create_reset_digest
      @seller.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def update
    if params[:seller][:password].empty?                  # Case (3)
      @seller.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @seller.update_attributes(seller_params)          # Case (4)
      log_in @seller
      flash[:success] = "Password has been reset."
      redirect_to @seller
    else
      render 'edit'                                     # Case (2)
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:password, :password_confirmation)
  end

  def get_seller
    @seller = Seller.find_by(email: params[:email])
  end

  # Confirms a valid seller.
  def valid_seller
    unless (@seller && @seller.activated? &&
        @seller.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @seller.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

end
