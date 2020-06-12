class Artist < ApplicationRecord
  has_secure_password
  has_many :availabilities
  has_many :requests, through: :availabilities
  validates :name, uniqueness: { case_sensitive: false }
end
