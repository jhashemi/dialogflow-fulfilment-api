# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Decorators
      class AcceptRenewal < Base
        def output_contexts
          super << context_sync_attributes
        end

        private

        def context_sync_attributes
          {
            'lifespanCount' => 15,
            'name' => context_name(name: 'sync-attributes'),
            'parameters' => sync_attributes
          }
        end

        def sync_attributes
          sync_items << card_item
          sync_items << detail_item
          sync_items << map_item
          sync_items << profile_item
          sync_items << timeline_item

          super
        end

        def detail_item
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Detail
            .new(
              items: [
                {
                  title: 'test',
                  type: 'text',
                  width: 'full',
                  data: 'Hello'
                }
              ],
              width: 'third'
            )
        end

        def card_item
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Card
            .new(
              items: [
                {
                  title: 'test',
                  type: 'text',
                  width: 'full',
                  data: 'Hello'
                }
              ],
              width: 'third'
            )
        end

        def profile_item
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Profile
            .new(
              items: [
                {
                  type: 'text',
                  width: 'full',
                  data: 'Hello'
                }
              ],
              width: 'third'
            )
        end

        def map_item
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Map.new(
            lat: '',
            lng: '',
            width: 'full'
          )
        end

        def timeline_item
          Dialogflow::Fulfilments::Decorators::OutputContexts::Sync::Profile
            .new(
              items: [
                {
                  title: 'title',
                  subtitle: 'subtitle'
                }
              ],
              width: 'full'
            )
        end
      end
    end
  end
end
