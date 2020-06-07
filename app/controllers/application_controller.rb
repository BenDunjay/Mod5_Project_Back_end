class ApplicationController < ActionController::API
  # before_action :artist_authorized, :venue_authorized

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

  def current_artist
    if decoded_token
      artist_id = decoded_token["artist_id"]
      @artist = Artist.find_by(id: artist_id)
    elsif nil
    end
  end

  def current_venue
    if decoded_token
      venue_id = decoded_token["venue_id"]
      @venue = Venue.find_by(id: venue_id)
    else
      nil
    end
  end

  def artist_logged_in?
    !!current_artist
  end

  def venue_logged_in?
    !!current_venue
  end

  def artist_authorized
    if !artist_logged_in?
      render json: { message: "Please log in" }, status: :unauthorized
    end
  end

  def venue_authorized
    if !venue_logged_in?
      render json: { message: "Please log in" }, status: :unauthorized
    end
  end
end
