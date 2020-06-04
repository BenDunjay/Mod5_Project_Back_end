class Api::V1::ArtistsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @artist = Artist.create(artist_params)
    if @artist.valid?
      render json: { artist: ArtistSerializer.new(@artist) }, status: :created
    else
      render json: { error: "failed to create artist" }, status: :not_acceptable
    end
  end

  def profile
    @artist = Artist.find_by(id: params[:id])
    render json: { artist: ArtistSerializer.new(@artist) }
  end

  def edit_profile
    @artist = current_artist
    @artist.update(artist_params)
    render json: { artist: ArtistSerializer.new(@artist) }
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :password)
  end
end
