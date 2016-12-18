class AdminsController < ApplicationController
  def dashboard
    if admin?
      @products = Product.where(approved: false)
    else
      redirect_to root_path
    end
  end
end
