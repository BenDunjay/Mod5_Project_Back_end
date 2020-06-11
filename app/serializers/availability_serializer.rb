class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id, :date
  belongs_to :artist
end
