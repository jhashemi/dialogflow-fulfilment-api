# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dialogflow::Fulfilments::Parsers::Helpers::OutputContexts do
  describe '#format_parameters' do
    it 'format_parameterss and normalises the output parameters' do
      output_contexts = [
        {
          name: 'stock-check-followup',
          parameters: {
            beverages: 'cola',
            action: 'some_food_action',
            'another-param': 'some_value'
          },
          'lifespan': 2
        },
        {
          name: 'stock-take',
          parameters: {
            beverages: 'cola',
            action: 'some_drink_action',
            'another-param': 'some_value'
          },
          'lifespan': 2
        }
      ]

      result = described_class.format_parameters(output_contexts)

      expected = [
        {
          name: 'stock-check-followup',
          parameters: {
            beverages: 'cola',
            action: 'some_food_action',
            another_param: 'some_value'
          },
          'lifespan': 2
        },
        {
          name: 'stock-take',
          parameters: {
            beverages: 'cola',
            action: 'some_drink_action',
            another_param: 'some_value'
          },
          'lifespan': 2
        }
      ]
      expect(result).to eq(expected)
    end

    context 'output context parameters are empty' do
      it 'returns an empty hash' do
        output_contexts = [
          {
            name: 'stock-check-followup',
            'lifespan': 2
          }
        ]

        result = described_class.format_parameters(output_contexts)
        expected = [
          {
            name: 'stock-check-followup',
            lifespan: 2,
            parameters: {}
          }
        ]

        expect(result).to eq(expected)
      end
    end
  end

  describe '#extract_parameters' do
    it 'extracts the parameters from the contexts' do
      output_contexts = [
        {
          name: 'stock-check-followup',
          parameters: {
            beverages: 'cola',
            action: 'some_drink_action',
            another_param: 'some_value'
          },
          'lifespan': 2
        },
        {
          name: 'stock-take',
          parameters: {
            food: 'crisps',
            action: 'some_food_action'
          },
          'lifespan': 2
        }
      ]

      result = described_class.extract_parameters(output_contexts)

      expected = {
        beverages: 'cola',
        action: 'some_food_action',
        another_param: 'some_value',
        food: 'crisps'
      }
      expect(result).to eq(expected)
    end

    context 'output context parameters are empty' do
      it 'returns an empty hash' do
        output_contexts = [
          {
            name: 'stock-check-followup',
            'lifespan': 2
          }
        ]

        result = described_class.extract_parameters(output_contexts)

        expected = {}
        expect(result).to eq(expected)
      end
    end
  end
end
