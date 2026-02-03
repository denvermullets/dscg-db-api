class MastersController < ApplicationController
  def index
    masters = Master.all
    if params[:query].present?
      masters = masters.left_joins(:master_artists)
                       .where('master.title ILIKE :q OR master_artist.artist_name ILIKE :q', q: "%#{params[:query]}%")
                       .distinct
    end
    masters = masters.where(vinyl: true) if params[:vinyl].present?
    @pagy, @records = pagy(:offset, masters)
    @records = Master.includes(:master_genres, :master_styles).where(id: @records.map(&:id))
    render json: { pagy: @pagy.data_hash, data: @records.as_json(include: {
                                                                   master_genres: {},
                                                                   master_styles: {}
                                                                 }) }
  end

  def show
    master = Master.includes(
      :master_artists,
      :master_genres,
      :master_styles,
      :master_images,
      :master_videos,
      :releases
    ).find(params[:id])

    render json: master, include: {
      master_artists: {},
      master_genres: {},
      master_styles: {},
      master_images: {},
      master_videos: {},
      releases: {}
    }
  end
end
