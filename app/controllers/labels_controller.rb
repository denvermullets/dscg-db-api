class LabelsController < ApplicationController
  def index
    labels = Label.all
    labels = labels.where('name ILIKE ?', "%#{params[:query]}%") if params[:query].present?
    @pagy, @records = pagy(:offset, labels)
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
