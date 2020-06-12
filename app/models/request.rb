class Request < ApplicationRecord
  belongs_to :venue
  belongs_to :availability

  def date
    self.availability.date
  end
end
