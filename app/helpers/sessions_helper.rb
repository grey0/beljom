module SessionsHelper
  # logs in seller
  def log_in(seller)
    session[:seller_id] = seller.id
  end

  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_seller
    @current_seller ||= Seller.find_by(id: session[:seller_id])
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !session[:seller_id].nil?
  end

  def admin?
    !session[:admin_id].nil?
  end

  def log_out
    session.delete(:seller_id)
    @current_user = nil
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end
end
