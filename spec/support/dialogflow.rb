# frozen_string_literal: true

module Dialogflow
  module Helpers
    def fulfilment_request
      @fulfilment_request ||= {
        'responseId' => '744dea02-c688-46b7-9603-5f65a9a179f7-9cc28bb4',
        'queryResult' => {
          'queryText' => 'hello',
          'action' => 'input.welcome',
          'parameters' => {
            'action' => 'escalate',
            'something' => 'blurb'
          },
          'allRequiredParamsPresent' => true,
          'fulfillmentText' => 'Welcome back, how can we help you today?',
          'fulfillmentMessages' => [
            {
              'text' => {
                'text' => ['Welcome back, how can we help you today?']
              }
            }
          ],
          'outputContexts' => [
            {
              'name' => "#{df_session}/contexts/phone_number",
              'lifespanCount' => 5,
              'parameters' => {
                'phone_number' => '+447777564523',
                'something.original' => ''
              }
            }
          ],
          'intent' => {
            'name' => df_intent,
            'displayName' => 'Default Welcome Intent'
          },
          'intentDetectionConfidence' => 1.0,
          'languageCode' => 'en'
        },
        'originalDetectIntentRequest' => {
          'payload' => {}
        },
        'session' => df_session,
        'alternativeQueryResults' => [
          {
            'queryText' => 'hello',
            'languageCode' => 'en'
          }
        ],
        'fulfilment' => {
          'responseId' => '744dea02-c688-46b7-9603-5f65a9a179f7-9cc28bb4',
          'queryResult' => {
            'queryText' => 'hello',
            'action' => 'input.welcome',
            'parameters' => {
              'action' => 'escalate',
              'something' => 'blurb'
            },
            'allRequiredParamsPresent' => true,
            'fulfillmentText' => 'Welcome back, how can we help you today?',
            'fulfillmentMessages' => [
              {
                'text' => {
                  'text' => [
                    'Welcome back, how can we help you today?'
                  ]
                }
              }
            ],
            'outputContexts' => [
              {
                'name' => "#{df_session}/contexts/phone_number",
                'lifespanCount' => 5,
                'parameters' => {
                  'something' => 'blurb',
                  'something.original' => ''
                }
              }
            ],
            'intent' => {
              'name' => df_intent,
              'displayName' => 'Default Welcome Intent'
            },
            'intentDetectionConfidence' => 1.0,
            'languageCode' => 'en'
          },
          'originalDetectIntentRequest' => {
            'payload' => {}
          },
          'session' => df_session,
          'alternativeQueryResults' => [
            {
              'queryText' => 'hello',
              'languageCode' => 'en'
            }
          ]
        }
      }
    end

    def df_intent
      "#{df_agent}/intents/cd739438-d685-41d1-8571-58a901702396"
    end

    def df_session
      "#{df_agent}/sessions/8aad0647-49ba-bf6c-9ca7-ae350cf11813"
    end

    def df_agent
      'projects/deliveroo-cc-staging/agent'
    end
  end
end
