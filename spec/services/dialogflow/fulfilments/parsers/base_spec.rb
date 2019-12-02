# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dialogflow::Fulfilments::Parsers::Base do
  describe '#action' do
    it 'returns the action from the parameters' do
      expected = query_result.dig('parameters', 'action')

      expect(parser.action).to eq(expected)
    end
  end

  describe '#all_required_parameters' do
    it 'returns all required parameters value of intent request' do
      expected = query_result['allRequiredParamsPresent']

      expect(parser.all_required_parameters).to eq(expected)
    end
  end

  describe '#intent_uuid' do
    it 'returns an uuid of intent reuquest' do
      expected = query_result.dig('intent', 'name')

      expect(parser.intent_uuid).to eq(expected)
    end
  end

  describe '#intent' do
    it 'returns intent from Dialogflow response' do
      expected = query_result.dig('intent', 'displayName')

      expect(parser.intent).to eq(expected)
    end
  end

  describe '#output_context_parameters' do
    it 'returns output_contexts from Dialogflow response' do
      expected = {
        phone_number: '+447777564523',
        'something.original': ''
      }

      expect(parser.output_context_parameters).to eq(expected)
    end
  end

  describe '#output_contexts' do
    it 'returns output_contexts from Dialogflow response' do
      expected = query_result['outputContexts'].map(&:deep_symbolize_keys)

      expect(parser.output_contexts).to eq(expected)
    end
  end

  describe '#parameters' do
    it 'returns parameters from Dialogflow response' do
      expected = query_result['parameters'].symbolize_keys

      expect(parser.parameters).to eq(expected)
    end
  end

  describe '#payload' do
    it 'returns original detect intent request payload' do
      expected = fulfilment_request.dig(
        'originalDetectIntentRequest',
        'payload'
      ).symbolize_keys

      expect(parser.payload).to eq(expected)
    end
  end

  describe '#session' do
    it 'returns session from Dialogflow response' do
      expected = fulfilment_request['session']

      expect(parser.session).to eq(expected)
    end
  end

  describe '#score' do
    it 'returns score from Dialogflow response' do
      expected = query_result['intentDetectionConfidence'] * 100

      expect(parser.score).to eq(expected)
    end
  end

  describe '#speech' do
    it 'returns speech from Dialogflow response' do
      expected = query_result['fulfillmentText']

      expect(parser.speech).to eq(expected)
    end
  end

  describe '#query_text' do
    it 'rerurns requested text' do
      expected = query_result['queryText']

      expect(parser.query_text).to eq(expected)
    end
  end

  def query_result
    fulfilment_request['queryResult']
  end

  def parser
    @parser ||= described_class.new(request: fulfilment_request)
  end
end
