class AvailabilitiesController < ApplicationController
  def index
    availability = Availability.availability
    render json: availabilities, include: [:artists]
  end
end
