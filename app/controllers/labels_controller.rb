class LabelsController < ApplicationController
  def index
    @pagy, @records = pagy(:offset, Label.all)
    render json: { pagy: @pagy.data_hash, data: @records }
  end

  def show
    label = Label.includes(
      :label_images,
      :label_urls,
      :sublabels,
      :parent
    ).find(params[:id])

    render json: label, include: {
      label_images: {},
      label_urls: {},
      sublabels: {},
      parent: {}
    }
  end
end
