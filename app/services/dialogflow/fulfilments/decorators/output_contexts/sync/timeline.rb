# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      module OutputContexts
        module Sync
          class Timeline
            def initialize(width:, items: [])
              self.items = Array(items)
              self.width = width
            end

            def build
              {
                template: 'timeline',
                width: width,
                title: 'Timeline',
                items: items.map do |item|
                  {
                    title: item[:title],
                    subtitle: item[:subtitle]
                  }
                end
              }
            end

            private

            attr_accessor :items, :width
          end
        end
      end
    end
  end
end
