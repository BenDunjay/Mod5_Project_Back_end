class Api::V1::ArtistsController < ApplicationController
  before_action :authorized, only: [:profile]
  before_action :venue_authorized, only: [:all_artists]
  before_action :artist_authorized, only: [:edit_profile]

  def all_artists
    @artists = Artist.all
    render json: @artists, each_serializer: ArtistSerializer
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.valid?
      render json: { artist: ArtistSerializer.new(@artist) }, status: :created
    else
      render json: { error: "failed to create artist" }, status: :not_acceptable
    end
  end

  def profile
    @artist = Artist.find_by(name: params[:name])
    render json: @artist, serializer: ArtistSerializer
  end

  def edit_profile
    @artist = logged_in_user
    byebug
    @artist.update(artist_params)
    byebug
    render json: { artist: ArtistSerializer.new(@artist) }
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :password, :bio, :instagram, :spotify, :username, :profile_picture, :phone_number, :artist_genre, :email_address)
  end
end
