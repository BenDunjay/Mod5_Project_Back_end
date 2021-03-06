class Api::V1::RequestsController < ApplicationController
  before_action :venue_authorized, only: [:create_request]
  before_action :artist_authorized, only: [:accept_or_reject]
  before_action :authorized, only: [:all_bookings]

  #will take the logged in user and pass the my_requests method. This method separates the requests and passes them through the serializer to make them neater with the necessary details.
  def all_bookings
    byebug
    @requests = logged_in_user.my_requests
    render json: @requests
  end

  # will create a new request. If the request is valid (meets the criteria to create a request), then it will render
  def create_request
    @request = Request.create(payment: params[:payment], number_of_hours: params[:number_of_hours], availability_id: params[:availability_id], start_time: params[:start_time], venue: logged_in_user)
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
