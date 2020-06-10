class Request < ApplicationRecord
  belongs_to :venue
  belongs_to :availability
end
