class MastersController < ApplicationController
  def index
    @pagy, @records = pagy(:offset, Master.all)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def show
    master = Master.includes(
      :master_artists,
      :master_genres,
      :master_styles,
      :master_images,
      :master_videos
    ).find(params[:id])

    render json: master, include: {
      master_artists: {},
      master_genres: {},
      master_styles: {},
      master_images: {},
      master_videos: {}
    }
  end
end
