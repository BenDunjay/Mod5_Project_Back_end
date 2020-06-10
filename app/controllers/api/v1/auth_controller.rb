class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:artist_login, :venue_login]

  def artist_login
    @artist = Artist.find_by(name: artist_login_params[:name])
    if @artist && @artist.authenticate(artist_login_params[:password])
      token = encode_token({ id: @artist.id, artist: true })
      render json: { artist: ArtistSerializer.new(@artist), jwt: token }
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
    end
  end

  def venue_login
    @venue = Venue.find_by(name: venue_login_params[:name])
    if @venue && @venue.authenticate(venue_login_params[:password])
      token = encode_token({ id: @venue.id, artist: false })
      render json: { venue: VenueSerializer.new(@venue), jwt: token }, status: :accepted
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
    end
  end

  private

  def artist_login_params
    params.require(:artist).permit(:name, :password)
  end

  def venue_login_params
    params.require(:venue).permit(:name, :password)
  end
end
