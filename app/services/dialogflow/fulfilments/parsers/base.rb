# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Parsers
      class Base
        include Dialogflow::Fulfilments::Parsers::Helpers::OutputContexts

        def initialize(request:)
          self.request = request.deep_symbolize_keys
        end

        def action
          parameters.dig(:action) || query_result.dig(:action)
        end

        def all_required_parameters
          query_result[:allRequiredParamsPresent]
        end

        def fallback_intent?
          intent_hash[:isFallback]
        end

        def intent_uuid
          intent_hash[:name]
        end

        def intent
          intent_hash[:displayName]
        end

        def messages
          query_result[:fulfillmentMessages]
        end

        def output_context_parameters
          extract_parameters(output_contexts)
        end

        def output_contexts
          format_parameters(query_result[:outputContexts])
        end

        def parameters
          query_result[:parameters].presence || {}
        end

        def payload
          request.dig(:originalDetectIntentRequest, :payload)
        end

        def query_text
          query_result[:queryText]
        end

        def score
          (query_result[:intentDetectionConfidence].presence || 0) * 100
        end

        def session
          request[:session]
        end

        def speech
          query_result[:fulfillmentText]
        end

        private

        attr_accessor :request

        def fulfilment_messages(platform:)
          Array(query_result[:fulfillmentMessages]).detect do |r|
            r.dig(:platform) == platform
          end || {}
        end

        def intent_hash
          query_result.dig(:intent) || {}
        end

        def query_result
          request[:queryResult] || {}
        end
      end
    end
  end
end
