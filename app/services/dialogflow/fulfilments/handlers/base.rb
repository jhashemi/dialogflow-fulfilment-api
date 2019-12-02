# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Handlers
      class Base
        def initialize(params:)
          self.params = params.to_h
        end

        def handle
          decorator.decorate
        end

        private

        attr_accessor :params

        def decorator
          decorator_klass.new(
            params: params
          )
        end

        def decorator_klass
          "Dialogflow::Fulfilments::Decorators::#{action_klass}".constantize
        rescue NameError
          Dialogflow::Fulfilments::Decorators::Base
        end

        def action_klass
          action.camelize
        end

        delegate :action, to: :fulfilment
        def fulfilment
          @fulfilment ||= Dialogflow::Fulfilments::Parsers::Base.new(
            request: params
          )
        end
      end
    end
  end
end
