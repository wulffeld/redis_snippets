RSpec.configure do |config|
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
