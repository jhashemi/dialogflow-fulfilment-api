# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      module OutputContexts
        module Sync
          class Builder
            def initialize(items: [])
              self.items = Array(items)
            end

            def build
              items.reverse.flat_map(&:build)
            end

            private

            attr_accessor :items
          end
        end
      end
    end
  end
end
