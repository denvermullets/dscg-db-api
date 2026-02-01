class ArtistsController < ApplicationController
  def index
    artists = Artist.all
    artists = artists.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?
    @pagy, @records = pagy(:offset, artists)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def show
    artist = Artist.includes(
      :artist_aliases,
      :artist_images,
      :artist_namevariations,
      :artist_urls,
      :group_memberships,
      :members,
      :masters
    ).find(params[:id])

    render json: artist, include: {
      artist_aliases: {},
      artist_images: {},
      artist_namevariations: {},
      artist_urls: {},
      group_memberships: {},
      members: {},
      masters: {}
    }
  end
end
