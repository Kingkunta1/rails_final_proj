class User < ApplicationRecord
  has_secure_password
  has_many :sneakers
  # has_many :brands_
  has_many :brands, through: :sneakers


  # accepts_nested_attributes_for :sneakers
  validates :username,:email, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: { minimum: 5 }
  validates :password, length: {minimum: 5}


  # scope method

  scope :more_than_one_sneaker, -> {joins(:sneakers).group(:user_id).having('count(users.id) > 1')}
  # user has more than one sneaker
  # I want to return an array of users that have more than one sneaker
  # maybe I have to use the join method and then search from the combined tables
  # I am getting information from two different tables ( Users and Sneakers)
  # def self.more_than_one_sneaker
  #   users_all = User.all.select { |user| user.sneakers.count > 1   }
  #   # returns an array of user objects that have more than one sneaker
  #     users = []
  #     users_all.map do |u|
  #         u.username
  #      users << u.username
  #     end
  #     return users
  #   # binding.pry
  # end
  # Figuring out scope method
  # 1. User.joins(:sneakers) -> displays all users that have a sneaker
  # 2. User.joins(:sneakers).group(:user_id) -> make subset of thise users
  # 3. User.joins(:sneakers).group(:user_id).count -> transformrs the subset to an integer
  # 4. User.joins(:sneakers).group(:user_id).having('count(users.id) > 1')
  # class Shirt < ActiveRecord::Base
  # scope :red, -> { where(color: 'red') }
  # scope :dry_clean_only, -> { joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true) }
  # end

  # scope :more_than_one_sneaker, ->{ joins(:sneakers).where('sneakers.more_than_one_sneaker = ?', 1) }
  #
  # scope :jersey_number_84, ->{where(jersey_number: 84)}

  # scope :more_than_one_sneaker, ->{where(user.sneakers.count : >1)}


end
