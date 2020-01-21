class Hotel < ApplicationRecord
  has_many :rooms , dependent: :destroy
  has many :reviews, dependent: :destroy
end
