class RequestsController < ApplicationController
  def create_request
    @request = Request.create(request_params)
    if @request.valid?
      render json: @request, serializer: RequestSerializer, status: :created
    else
      render json: { error: "failed to create request" }, status: :not_acceptable
    end
  end

  private

  def request_params
    params.require(:request).permit(:payment, :number_of_hours, :availability_id, :venue_id)
  end
end
