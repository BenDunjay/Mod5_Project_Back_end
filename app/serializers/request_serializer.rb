class RequestSerializer < ActiveModel::Serializer
  attributes :id, :payment, :number_of_hours
  has_many :venues
  has_many :availabilities
end
