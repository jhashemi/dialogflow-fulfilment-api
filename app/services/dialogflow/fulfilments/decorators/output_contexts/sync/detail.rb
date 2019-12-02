# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      module OutputContexts
        module Sync
          class Detail
            def initialize(width:, items: [])
              self.items = Array(items)
              self.width = width
            end

            def build
              {
                template: 'detail',
                width: width,
                items: items.map do |item|
                  {
                    title: item[:title],
                    type: item[:type],
                    width: item[:width],
                    data: item[:data]
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
