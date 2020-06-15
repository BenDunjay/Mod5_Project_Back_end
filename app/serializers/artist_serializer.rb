class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :id, :username, :email_address, :artist_genre, :bio, :phone_number, :instagram, :spotify, :profile_picture
  has_many :availabilities
end
