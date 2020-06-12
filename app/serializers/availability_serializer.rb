class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :requests
  belongs_to :artist
end
