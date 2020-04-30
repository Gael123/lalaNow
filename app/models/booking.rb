class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  monetize :amount_cents
end
