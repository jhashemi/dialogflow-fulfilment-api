# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dialogflow::Fulfilments::Decorators::Base do
  describe '#decorate' do
    it 'returns the fulfilment response' do
      decorator = described_class.new(params: fulfilment_request)

      expected = {
        fulfillmentText: fulfilment_text,
        fulfillmentMessages: fulfilment_messages,
        payload: payload,
        outputContexts: output_contexts
      }
      expect(decorator.decorate).to eq(expected)
    end
  end

  def fulfilment_text
    parsed_fulfilment.dig(:queryResult, :fulfillmentText)
  end

  def fulfilment_messages
    parsed_fulfilment.dig(:queryResult, :fulfillmentMessages)
  end

  def payload
    {}
  end

  def output_contexts
    parsed_fulfilment.dig(:queryResult, :outputContexts)
  end

  def parsed_fulfilment
    @parsed_fulfilment ||= fulfilment_request.deep_symbolize_keys!
  end
end
