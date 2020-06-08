class Api::V1::AvailabilitiesController < ApplicationController
  def index
    availability = Availability.all
    render json: availabilities, include: [:artists]
  end

  def create_availability
    @availability = Availability.create(availability_params)
    if @availability.valid?
      render json: @availability, serializer: AvailabilitySerializer, status: :created
    else
      render json: { error: "failed to create availability" }, status: :not_acceptable
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:date, :artist_id)
  end
end
