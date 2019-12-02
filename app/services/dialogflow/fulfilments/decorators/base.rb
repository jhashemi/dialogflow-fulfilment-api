# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      class Base
        def initialize(params:)
          self.params = params
        end

        def decorate
          {
            fulfillmentText: fulfilment_text,
            fulfillmentMessages: fulfilment_messages,
            payload: payload,
            outputContexts: output_contexts
          }
        end

        private

        attr_accessor :params

        def fulfilment_text
          fulfilment.speech
        end

        def fulfilment_messages
          fulfilment.messages
        end

        def payload
          {}
        end

        def output_contexts
          fulfilment.output_contexts
        end

        def fulfilment
          @fulfilment ||= Dialogflow::Fulfilments::Parsers::Base.new(
            request: params
          )
        end
      end
    end
  end
end
