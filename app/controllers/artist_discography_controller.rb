class ArtistDiscographyController < ApplicationController
  ARTIST_INCLUDES = %i[
    artist_aliases artist_images artist_namevariations
    artist_urls group_memberships members
  ].freeze

  ARTIST_JSON = {
    artist_aliases: {}, artist_namevariations: {},
    artist_urls: {}, group_memberships: {}, members: {}
  }.freeze

  MASTER_JSON = { master_genres: {}, master_styles: {} }.freeze

  def show
    artist = Artist.includes(*ARTIST_INCLUDES).find(params[:id])

    masters = artist.masters.includes(:master_genres, :master_styles)
    masters = masters.where(vinyl: true) if params[:vinyl].present?

    @pagy, @records = pagy(:offset, masters)

    render json: {
      pagy: @pagy.data_hash,
      data: {
        artist: artist.as_json(include: ARTIST_JSON),
        masters: @records.as_json(include: MASTER_JSON)
      }
    }
  end
end
