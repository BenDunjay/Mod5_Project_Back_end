class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :id
  has_many :availabilities
end
