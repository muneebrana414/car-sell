class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
  :confirmable

  validates :username, length: { in: 6..30 }
  validates :encrypted_password, format: { with: /\A(?=.*\d)(?=.*([A-Z]))([\x20-\x7E]|[^\x00-\x7F]){6,100}\z/ }
end
