class ArtistsController < ApplicationController
  def index
    artists = params[:query].present? ? search_artists(params[:query]) : Artist.where(ingested: false)
    @pagy, @records = pagy(:offset, artists)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def ingest
    artist = Artist.find(params[:id])
    artist.update!(ingested: true)
    render json: artist
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

  private

  def search_artists(query)
    sanitized_query = ActiveRecord::Base.sanitize_sql_like(query)
    exact_match_sql = "CASE WHEN REGEXP_REPLACE(artist.name, ' \\(\\d+\\)$', '') ILIKE ? THEN 0 ELSE 1 END"

    Artist
      .where(ingested: false)
      .where('name ILIKE ?', "%#{sanitized_query}%")
      .left_joins(:master_artists)
      .group('artist.id')
      .select('artist.*', 'COUNT(master_artist.id) as master_count')
      .order(
        Arel.sql(ActiveRecord::Base.sanitize_sql_array([exact_match_sql, sanitized_query])),
        Arel.sql('COUNT(master_artist.id) DESC')
      )
  end
end
