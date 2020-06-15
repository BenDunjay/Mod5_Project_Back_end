class RequestSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :payment, :number_of_hours, :availability_id, :date, :name, :accept, :postcode, :phone_number
end
