class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:artist_login, :venue_login]

  #will look to find the artist via the username entered then will compare the artist username and password to see if they match. Will then encode the token. Will then create the artist object including the token

  def artist_login
    @artist = Artist.find_by(username: artist_login_params[:username])
    if @artist && @artist.authenticate(artist_login_params[:password])
      token = encode_token({ id: @artist.id, artist: true })
      render json: { artist: ArtistSerializer.new(@artist), jwt: token }
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
    end
  end

  #looks for the key of artist in the decoded token header. If it's true will then look to find the artist by the id passed in the token. Else will look for the venue if it is a venue key.

  def refresh
    token = decoded_token
    if token["artist"] == true
      @artist = Artist.find_by(id: token["id"])
      token = encode_token({ id: @artist.id, artist: true })
      render json: { artist: ArtistSerializer.new(@artist), jwt: token }
    elsif token["artist"] == false
      @venue = Venue.find_by(id: token["id"])
      token = encode_token({ id: @venue.id, artist: false })
      render json: { venue: VenueSerializer.new(@venue), jwt: token }
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
    params.require(:artist).permit(:username, :password)
  end

  def venue_login_params
    params.require(:venue).permit(:name, :password)
  end
end
