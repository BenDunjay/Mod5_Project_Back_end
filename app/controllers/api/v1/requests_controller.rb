class RequestsController < ApplicationController
  before_action :venue_authorized, only: [:create_request]

  def create_request
    @request = Request.create(request_params, venue: logged_in_user)
    if @request.valid?
      render json: @request, serializer: RequestSerializer, status: :created
    else
      render json: { error: "failed to create request" }, status: :not_acceptable
    end
  end

  private

  def request_params
    params.require(:request).permit(:payment, :number_of_hours, :availability_id)
  end
end
