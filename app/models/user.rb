# .nodoc. #
class User < ApplicationRecord
  has_paper_trail
  has_secure_password

  attr_accessor :remember_token

  has_many :addresses, as: :addressable, dependent: :destroy

  validates :cpf, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true,
                       allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :update,
                                    unless: ->(user) { user.password.blank? }

  before_save { email.downcase! }

  enum marital_status: [:unknown, :single, :married, :common_law, :widowed, :separated,
                        :divorced]
  enum role: [:new_user, :admin, :production, :technic, :seller]

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
