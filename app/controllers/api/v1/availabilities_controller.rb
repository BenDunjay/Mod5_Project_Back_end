class Api::V1::AvailabilitiesController < ApplicationController
  before_action :artist_authorized, only: [:create_availability]

  def create_availability
    @availability = Availability.create(date: params[:date], artist: logged_in_user)
    if @availability.valid?
      render json: @availability, serializer: AvailabilitySerializer, status: :created
    else
      render json: { error: "failed to create availability" }, status: :not_acceptable
    end
  end

  def get_availability
    @availability = Availability.find_by(id: params[:id])
    render json: @availability, serializer: AvailabilitySerializer
  end

  private

  def availability_params
    params.require(:availability).permit(:date)
  end
end
