# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dialogflow::Fulfilments::Handlers::Base do
  describe '#handle' do
    it 'calls decorate on the decorator klass' do
      stub_decorator_klass

      handler.handle

      expect(decorator_double).to have_received(:decorate)
    end
  end

  def stub_decorator_klass
    allow(decorator_klass).to receive(:new)
      .and_return(decorator_double)
  end

  def decorator_double
    @decorator_double ||= double(decorator_klass, decorate: true)
  end

  def decorator_klass
    Dialogflow::Fulfilments::Decorators::Base
  end

  def handler
    @handler = described_class.new(params: fulfilment_request)
  end
end
