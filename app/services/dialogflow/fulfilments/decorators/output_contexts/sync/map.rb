# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      module OutputContexts
        module Sync
          class Map
            def initialize(width:, lat:, lng:)
              self.lat = lat
              self.lng = lng
              self.width = width
            end

            def build
              {
                template: 'map',
                width: width,
                geolocation: {
                  lat: lat,
                  lng: lng
                }
              }
            end

            private

            attr_accessor :lat, :lng, :width
          end
        end
      end
    end
  end
end
