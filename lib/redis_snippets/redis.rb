module RedisSnippets
  class Redis
    class << self
      def get(key)
        RedisSnippets::Engine.config.redis_snippets[:connection].get(key)
      end

      def set(key, value)
        RedisSnippets::Engine.config.redis_snippets[:connection].set(key, value)
      end

      def del(key)
        RedisSnippets::Engine.config.redis_snippets[:connection].del(key)
      end
    end
  end
end
