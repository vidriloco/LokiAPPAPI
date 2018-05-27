class User < ApplicationRecord
  has_many :positions
  has_many :tracking_allowances
  has_many :routes, through: 'tracking_allowances'
  
  before_save :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable, authentication_keys: [:login]

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def authentication_fields
    { auth_token: self.authentication_token, username: self.username, email: self.email }
  end
  
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
