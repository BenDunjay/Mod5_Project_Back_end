class Venue < ApplicationRecord
  has_secure_password
  has_many :requests
end
