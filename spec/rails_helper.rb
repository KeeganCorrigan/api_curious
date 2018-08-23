require 'simplecov'
require 'omniauth'

SimpleCov.start 'rails' do
 add_filter "app/channels/application_cable/channel.rb"
 add_filter "app/channels/application_cable/connection.rb"
 add_filter "app/jobs/application_job.rb"
 add_filter "app/mailers/application_mailer.rb"
 add_filter "app/models/application_record.rb"
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<key>') { ENV["GITHUB_TEST"] }
end

def stub_omniauth
  OmniAuth.config.test_mode = true

  omniauth_hash = {
                    'provider' => 'github',
                    'uid' => '8312280',
                    'info' =>
                      {
                        'name' => 'Keegan Corrigan',
                        'email' => 'keegan.rw.corrigan@gmail.com',
                        'image' => 'https://avatars3.githubusercontent.com/u/8312280?v=4',
                        'nickname' => 'KeeganCorrigan'
                      },
                    'credentials' =>
                      {
                        'token' => ENV['GITHUB_TEST']
                      },
                    'extra' =>
                      {
                        'raw_info' =>
                          {
                            'public_repos' => '46'
                          }
                      }
                  }

  OmniAuth.config.add_mock(:github, omniauth_hash)
end

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.include FactoryBot::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
