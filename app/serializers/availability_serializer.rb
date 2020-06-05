class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :artist
end
