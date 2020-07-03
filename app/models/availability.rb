class Availability < ApplicationRecord
  has_many :requests, dependent: :destroy
  belongs_to :artist
end
