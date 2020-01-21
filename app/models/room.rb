class Room < ApplicationRecord
  belongs_to :hotels
  validates :price, presence: true
  validates :capacity, presence: true
end
