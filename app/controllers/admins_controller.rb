class AdminsController < ApplicationController
  def dashboard
    if admin?
      @products = Product.all
    else
      redirect_to root_path, status: 401
    end
  end
end
