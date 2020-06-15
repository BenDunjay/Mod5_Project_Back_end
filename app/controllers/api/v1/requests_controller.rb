class Api::V1::RequestsController < ApplicationController
  before_action :venue_authorized, only: [:create_request]
  before_action :artist_authorized, only: [:accept_or_reject]
  before_action :authorized, only: [:all_bookings]

  def all_bookings
    @requests = logged_in_user.my_requests
    render json: @requests
  end

  def create_request
    @request = Request.create(payment: params[:payment], number_of_hours: params[:number_of_hours], availability_id: params[:availability_id], venue: logged_in_user)
    if @request.valid?
      render json: @request, serializer: RequestSerializer, status: :created
    else
      render json: { error: "failed to create request" }, status: :not_acceptable
    end
  end

  def accept_or_reject
    @request = Request.find_by(id: params[:id])
    @request.update(request_params)
    render json: @request, serializer: RequestSerializer
  end

  private

  def request_params
    params.require(:request).permit(:payment, :number_of_hours, :availability_id, :accept)
  end
end
