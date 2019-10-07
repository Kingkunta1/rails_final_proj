class Sneaker < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :brand

   validates :name, uniqueness: true
   validates :name, presence: true
   validates :color, presence: true


end
