class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # if I have a restarant, I can do restauarnt.reviews. has_many method enable restaurant.review
  # if you delete a restaurant all the reviews that's dependent on the restaurant will be deleted as well
  validates :name, presence: true
end
