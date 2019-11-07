class Store < ApplicationRecord
  has_many :sneakers
  has_many :brands, through: :sneakers



# scope method
# which store carries most sneakers?
# I want to return an a single store object that carres the most sneakers.
# scope :most_sneakers ->{ Store.joins(:sneakers).distinct}
end
