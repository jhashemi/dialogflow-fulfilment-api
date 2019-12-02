# frozen_string_literal: true

module Api
  module Dialogflow
    class FulfilmentsController < Api::Dialogflow::BaseController
      def create
        handler.handle
      end

      private

      def handler
        @handler ||= Dialogflow::Fulfilments::Handlers::Base.new(
          params: fulfilment_params
        )
      end

      def fulfilment_params
        params.permit!
      end
    end
  end
end
