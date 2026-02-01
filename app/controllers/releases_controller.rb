class ReleasesController < ApplicationController
  SHOW_INCLUDES = [
    :release_artists, :release_companies, :release_formats, :release_genres,
    :release_styles, :release_identifiers, :release_images, :release_labels,
    { release_tracks: :release_track_artists }, :release_videos
  ].freeze

  SHOW_JSON = {
    release_artists: {}, release_companies: {}, release_formats: {},
    release_genres: {}, release_styles: {}, release_identifiers: {},
    release_images: {}, release_labels: {},
    release_tracks: { include: :release_track_artists }, release_videos: {}
  }.freeze

  def index
    releases = Release.all
    releases = releases.where('title ILIKE ?', "%#{params[:query]}%") if params[:query].present?
    if params[:format].present?
      matching_ids = ReleaseFormat.where('name ILIKE ?', params[:format])
                                  .select(:release_id)
      releases = releases.where(id: matching_ids)
    end
    @pagy, @records = pagy(:offset, releases)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def show
    release = Release.includes(*SHOW_INCLUDES).find(params[:id])
    render json: release, include: SHOW_JSON
  end
end
