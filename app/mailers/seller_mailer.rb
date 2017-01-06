class SellerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seller_mailer.account_activation.subject
  #
  def account_activation seller
    @seller = seller
    mail to: seller.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seller_mailer.password_reset.subject
  #
  def password_reset seller
    @seller = seller
    mail to: seller.email, subject: "Password reset"
  end
end
