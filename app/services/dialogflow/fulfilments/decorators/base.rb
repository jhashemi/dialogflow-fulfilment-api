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

        def context_name(name:)
          "#{session}/contexts/#{name}"
        end

        def sync_attributes
          {
            sync_attributes: {
              data: sync_builder.new(items: sync_items).build
            }
          }
        end

        def sync_builder
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Builder
        end

        def sync_items
          @sync_items ||= []
        end

        delegate :output_contexts,
                 :session,
                 to: :fulfilment

        def fulfilment
          @fulfilment ||= Dialogflow::Fulfilments::Parsers::Base.new(
            request: params
          )
        end
      end
    end
  end
end
