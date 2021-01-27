class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :items, dependent: :destroy

  has_secure_password
  
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }
end
