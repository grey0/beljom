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

  attr_accessor :remember_token, :activation_token

  has_many :products, dependent: :destroy

  def Seller.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Seller.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
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

  private

  def create_activation_digest
    self.activation_token  = Seller.new_token
    self.activation_digest = Seller.digest(activation_token)
  end
end
