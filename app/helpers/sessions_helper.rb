module SessionsHelper
  # logs in seller
  def log_in(seller)
    session[:seller_id] = seller.id
  end

  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_user
    if (seller_id = session[:seller_id])
      @current_user ||= Seller.find_by(id: seller_id)
    elsif (seller_id = cookies.signed[:seller_id])
      seller = Seller.find_by(id: seller_id)
      if seller && seller.authenticated?(:remember, cookies[:remember_token])
        log_in seller
        @current_user = seller
      end
    end
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

  def forget(seller)
    seller.forget
    cookies.delete(:seller_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:seller_id)
    @current_user = nil
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  def remember(seller)
    seller.remember
    cookies.permanent.signed[:seller_id] = seller.id
    cookies.permanent[:remember_token] = seller.remember_token
  end
end
