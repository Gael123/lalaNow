class Hotel < ApplicationRecord
geocoded_by :address
after_validation :geocode, if: :will_save_change_to_address?
has_many :rooms , dependent: :destroy
has_many :reviews, dependent: :destroy
end
