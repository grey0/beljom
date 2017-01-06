class Seller < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :phone_number, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_create :create_activation_digest

  attr_accessor :remember_token, :activation_token, :reset_token

  has_many :products, dependent: :destroy

  def Seller.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Seller.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a seller in the database for use in persistent sessions.
  def remember
    self.remember_token = Seller.new_token
    update_attribute(:remember_digest, Seller.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a seller.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Seller.new_token
    update_attribute(:reset_digest,  Seller.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sets the password reset attributes.
  # def create_reset_digest
  #   self.reset_token = seller.new_token
  #   update_columns(reset_digest:  FILL_IN, reset_sent_at: FILL_IN)
  # end

  # Sends password reset email.
  def send_password_reset_email
    SellerMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  def create_activation_digest
    self.activation_token  = Seller.new_token
    self.activation_digest = Seller.digest(activation_token)
  end
end
