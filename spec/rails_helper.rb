# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)


# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Automatically load support files in spec/support/ if you have any
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Include path to fixtures if you use them
  config.fixture_paths = [ "#{::Rails.root}/spec/fixtures" ]

  # Use transactional fixtures (you can disable this if using DatabaseCleaner)
  config.use_transactional_fixtures = true

  # Automatically infer spec type from file location
  config.infer_spec_type_from_file_location!

  # Filter Rails backtrace lines
  config.filter_rails_from_backtrace!

  # Include Devise helpers for request specs
  config.include Devise::Test::IntegrationHelpers, type: :request
end
