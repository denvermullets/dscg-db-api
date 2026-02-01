class MasterReleasesController < ApplicationController
  def index
    releases = Release.where(master_id: params[:master_id])
    if params[:media].present?
      matching_ids = ReleaseFormat.where('name ILIKE ?', params[:media].downcase)
                                  .select(:release_id)
      releases = releases.where(id: matching_ids)
    end
    @pagy, @records = pagy(:offset, releases.includes(:release_formats, :release_labels, :release_images))
    render json: { pagy: @pagy.data_hash, data: @records.map { |r| release_json(r) } }
  end

  private

  def release_json(release)
    release.as_json(include: {
                      release_formats: {},
                      release_labels: {},
                      release_images: {}
                    })
  end
end
