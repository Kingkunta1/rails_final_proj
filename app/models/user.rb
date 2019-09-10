class User < ApplicationRecord
  has_secure_password
  has_many :sneakers
  has_many :brands, through: :sneakers
  validates :username, :login, :email, :password, presence: true
  validates :email, :username, uniqueness: true

end
