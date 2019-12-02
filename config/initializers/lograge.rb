# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = Rails.env.production?
  config.lograge.custom_options = lambda do |event|
    exceptions = %w[controller action format]
    {
      params: event.payload[:params].except(*exceptions)
    }
  end
end
