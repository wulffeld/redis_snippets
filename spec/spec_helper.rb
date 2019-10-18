ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment', __dir__)
require 'rspec/rails'

include RedisSnippets::SnippetsHelper

Rails.application.config.redis_snippets = {
  connection: MockRedis.new,
  keys: [
    :advert_header,
    :advert_footer
  ]
}

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end
end
