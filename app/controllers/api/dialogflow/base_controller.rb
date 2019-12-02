# frozen_string_literal: true

module Api
  module Dialogflow
    class BaseController < ActionController::Base
      before_action :validate_request

      def response_successful(response = {})
        build_response(response, :ok)
      end

      def build_response(response, status)
        render(json: response, status: status) && return
      end

      private

      def validate_request
        true
      end
    end
  end
end
