class SessionsController < ApplicationController
  def new
    @seller = Seller.new
  end

  def create
    seller = Seller.find_by(email: params[:session][:email])
    if seller && seller.authenticate(params[:session][:password])
      flash[:notice] = "Successful"
      log_in seller
      redirect_to categories_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def create_admin
    admin = Admin.find_by(email: params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      flash[:notice] = "Successful"
      log_in_admin admin
      redirect_to categories_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
