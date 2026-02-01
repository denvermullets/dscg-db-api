class MastersController < ApplicationController
  def index
    masters = Master.all
    masters = masters.where('title ILIKE ?', "%#{params[:query]}%") if params[:query].present?
    @pagy, @records = pagy(:offset, masters)
    render json: { pagy: @pagy.data_hash, data: @records }
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
