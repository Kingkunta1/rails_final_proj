class Category < ApplicationRecord
  has_many :sneakers



  def self.search(params)
    if params
      where(["name LIKE ?", "%#{params}%"])
    else
      all
    end
  end
end
