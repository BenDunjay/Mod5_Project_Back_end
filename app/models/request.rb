class Request < ApplicationRecord
  belongs_to :venue
  belongs_to :availability

  def date
    self.availability.date
  end

  def name
    self.venue.name
  end

  def postcode
    self.venue.postcode
  end

  def phone_number
    self.venue.phone_number
  end
end
