module Api::ErrorHandler
  extend ActiveSupport::Concern

  ERRORS = [
    { class: 'StandardError', status: :internal_server_error, message: 'Something went wrong!' },
    { class: 'ActiveRecord::RecordNotFound', status: :not_found, message: 'Record not found!' },
    { class: 'ActiveRecord::RecordInvalid', status: :unprocessable_entity, message: 'Unprocessable Entity!' }
  ].freeze

  included do
    ERRORS.each do |error|
      rescue_from error[:class].constantize do |exception|
        render json: {
          status: Rack::Utils.status_code(error[:status]),
          error: error[:status].to_s,
          message: error[:message]
        }, status: error[:status]
      end
    end
  end
end
