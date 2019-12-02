# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'spec_helper'

require File.expand_path('../config/environment', __dir__)
abort('DATABASE_URL environment variable is set') if ENV['DATABASE_URL']

require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each do |file|
  require file
end

RSpec.configure do |config|
  config.include Dialogflow::Helpers
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end

ActiveRecord::Migration.maintain_test_schema!
