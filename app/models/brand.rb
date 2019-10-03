class Brand < ApplicationRecord
  has_many :sneakers
  has_many :users, through: :sneakers
  # has_many :stores,through: :sneakers

  
end
