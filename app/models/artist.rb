require "date"

class Artist < ApplicationRecord
  has_secure_password
  has_many :availabilities
  has_many :requests, through: :availabilities
  validates :username, uniqueness: { case_sensitive: false }

  def future_availabilities
    today = Date.today
    self.availabilities.select { |availability| availability.date > today }
  end

  def my_requests
    result = {
      accepted: [],
      rejected: [],
      pending: [],
    }

    requests.order(:id).each do |request| 
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

end
