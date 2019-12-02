# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Handlers
      class Base
        def initialize(params:)
          self.params = params
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
          "Dialogflow::Fulfilments::#{action}".constantize
        rescue NameError
          Dialogflow::Fulfilments::Decorators::Base
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
