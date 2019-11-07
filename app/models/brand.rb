class Brand < ApplicationRecord
  has_many :sneakers
  has_many :users, through: :sneakers
  has_many :stores, through: :sneakers
  belongs_to :store
  


  # has_many :stores,through: :sneakers


end
