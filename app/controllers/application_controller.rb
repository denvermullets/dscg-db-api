class ApplicationController < ActionController::API
  include Pagy::Method

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
end
