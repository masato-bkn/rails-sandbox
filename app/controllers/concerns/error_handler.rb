# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :response_record_not_found
  end

  def response_record_not_found(_error)
    render status: :not_found, json: { message: 'record_not_found' }
  end
end
