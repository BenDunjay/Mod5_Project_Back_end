class Artist < ApplicationRecord
  has_secure_password
  has_many :availabilities
  has_many :requests, through: :availabilities
  validates :username, uniqueness: { case_sensitive: false }

  def my_requests
    result = {
      accepted: [],
      rejected: [],
      pending: [],
    }

    self.requests.each do |request|
      serialized_request = RequestSerializer.new(request)
      if request.accept == nil
        result[:pending].push(serialized_request)
      elsif request.accept
        result[:accepted].push(serialized_request)
      else
        result[:rejected].push(serialized_request)
      end
    end

    result
  end

  # def sort_requests(array) ## sort each array so can be displayed by date order in tables.
  #   array.sort_by(&:request_id)
  # end
end
