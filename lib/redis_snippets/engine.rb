module RedisSnippets
  class Engine < ::Rails::Engine
    isolate_namespace RedisSnippets

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
