class RequestSerializer < ActiveModel::Serializer
  attributes :id, :payment, :number_of_hours, :availability_id, :date, :name, :accept
end
