class ApplicationController < ActionController::API
  # before_action :authorized

  def initialize
    @secret = ENV["ENV_VAR"]
  end

  def auth_header
    request.headers["Authorization"]
  end

  def encode_token(payload)
    JWT.encode(payload, @secret)
  end

  def decoded_token
    if auth_header
      token = auth_header
      begin
        return JWT.decode(token, @secret)[0]
      rescue JWT::DecodeError
        return nil
      end
    end
  end

  def logged_in_user
    user_info = decoded_token
    if user_info && user_info["artist"]
      Artist.find(user_info["id"])
    elsif user_info && !user_info["artist"]
      Venue.find(user_info["id"])
    else
      nil
    end
  end

  def authorized
    if !logged_in_user
      render json: { message: "Please log in" }, status: :unauthorized
    end
  end

  def artist_authorized
    user = logged_in_user

    if !user || user.class != Artist
      render json: { message: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end

  def venue_authorized
    user = logged_in_user
    if user && user.class != Venue
      render json: { message: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end
end
