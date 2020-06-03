class Api::V1::ArtistsController < ApplicationController
  #   skip_before_action :authorized, only: [:create]

  def create
    @artist = User.create(artist_params)
    if @artist.valid?
      render json: { artist: UserSerializer.new(@artist) }, status: :created
    else
      render json: { error: "failed to create artist" }, status: :not_acceptable
    end
  end

  def profile
    @artist = User.find(params[:id])
    render json: { artist: UserSerializer.new(@artist) }
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :password)
  end
end
