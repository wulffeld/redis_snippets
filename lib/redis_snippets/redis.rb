module RedisSnippets
  class Redis
    class << self
      # Can't do method_missing on get/set as they're defined somewhere by Ruby.
      def get(key)
        RedisSnippets::Engine.config.redis_snippets[:connection].get(key)
      end

      def set(key, value)
        RedisSnippets::Engine.config.redis_snippets[:connection].set(key, value)
      end

      def method_missing(method, *args)
        RedisSnippets::Engine.config.redis_snippets[:connection].send(method, *args)
      end
    end
  end
end
