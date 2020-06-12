class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :id
  has_many :availabilities
  has_many :requests, through: :availabilties
end
