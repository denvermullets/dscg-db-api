class ArtistsController < ApplicationController
  def index
    @pagy, @records = pagy(:offset, Artist.all)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def show
    artist = Artist.includes(
      :artist_aliases,
      :artist_images,
      :artist_namevariations,
      :artist_urls,
      :group_memberships,
      :members
    ).find(params[:id])

    render json: artist, include: {
      artist_aliases: {},
      artist_images: {},
      artist_namevariations: {},
      artist_urls: {},
      group_memberships: {},
      members: {}
    }
  end
end
