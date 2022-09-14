class User < ApplicationRecord
  acts_as_favoritor

  attribute :login, :string

  has_many :vehicles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
  :confirmable, authentication_keys: [:login]

  validates :username, length: { in: 6..30 }
  validates :password, format: { with: /\A(?=.*\d)(?=.*([A-Z]))([\x20-\x7E]|[^\x00-\x7F]){6,100}\z/ }
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(phone_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_h).first 
    end 
  end
end
