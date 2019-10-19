ENV['RAILS_ENV'] ||= 'test'

require 'support/simplecov_setup'

require File.expand_path('dummy/config/environment', __dir__)
require 'rspec/rails'
require 'redis_snippets'

include RedisSnippets::SnippetsHelper

Rails.application.config.redis_snippets = {
  connection: MockRedis.new,
  keys: [
    :advert_header,
    :advert_footer
  ]
}

RSpec.configure do |config|
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  def clean_keys!
    RedisSnippets::Engine.config.redis_snippets[:keys].each do |key|
      SnippetStoreService.del(key)
    end
  end

  config.before(:each) do
    clean_keys!
  end

  config.after(:each) do
    clean_keys!
  end
end
