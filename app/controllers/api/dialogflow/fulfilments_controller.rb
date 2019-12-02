# frozen_string_literal: true

module Api
  module Dialogflow
    class FulfilmentsController < Api::Dialogflow::BaseController
      def create
        response = handler_klass.new(
          params: fulfilment_params
        ).handle

        response_successful(response)
      end

      private

      def handler_klass
        ::Dialogflow::Fulfilments::Handlers::Base
      end

      def fulfilment_params
        params.permit!
      end
    end
  end
end
