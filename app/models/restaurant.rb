class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # if I have a restarant, I can do restauarnt.reviews.
  validates :name, presence: true
end
