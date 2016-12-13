module SessionsHelper
  # logs in seller
  def log_in(seller)
    session[:seller_id] = seller.id
  end

  def current_seller
    @current_seller ||= Seller.find_by(id: session[:sellers_id])
  end

  def logged_id?
    !session[:seller_id].nil?
  end

  def log_out
    session.delete(:seller_id)
    @current_user = nil
  end
end
