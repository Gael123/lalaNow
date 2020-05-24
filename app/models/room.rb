class Room < ApplicationRecord
  belongs_to :hotel
  validates :price, presence: true
  validates :capacity, presence: true
   monetize :price_cents
end
