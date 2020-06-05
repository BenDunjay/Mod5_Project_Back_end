class Artist < ApplicationRecord
  has_many :availabilities
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }
end
