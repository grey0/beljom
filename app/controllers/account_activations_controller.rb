class AccountActivationsController < ApplicationController

  def edit
    seller = Seller.find_by(email: params[:email])
    if seller && !seller.activated? && seller.authenticated?(:activation, params[:id])
      seller.update_attribute(:activated,    true)
      seller.update_attribute(:activated_at, Time.zone.now)
      log_in seller
      flash[:success] = "Account activated!"
      redirect_to seller
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
