# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      module OutputContexts
        module Sync
          class Profile
            def initialize(width:, items: [])
              self.items = Array(items)
              self.width = width
            end

            def build
              {
                template: 'profile',
                width: width,
                items: items.map do |item|
                  {
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
