class Availability < ApplicationRecord
  has_many :requests
  belongs_to :artist
end
