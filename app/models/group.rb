class Group < ActiveRecord::Base
  has_many :users
  has_many :locations
  has_many :food_items, through: :users
end
