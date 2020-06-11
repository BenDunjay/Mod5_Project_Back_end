class RequestSerializer < ActiveModel::Serializer
  attributes :id, :payment, :number_of_hours
  belongs_to :venue
  belongs_to :availability
end
