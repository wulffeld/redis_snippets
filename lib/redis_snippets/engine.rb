module RedisSnippets
  class Engine < ::Rails::Engine
    isolate_namespace RedisSnippets
  end
end
