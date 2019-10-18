module RedisSnippets
  class Redis
    class << self
      def get(key)
        connection.get(key)
      end

      def set(key, value)
        connection.set(key, value)
      end

      def del(key)
        connection.del(key)
      end

      protected

      def connection
        RedisSnippets::Engine.config.redis_snippets[:connection]
      end
    end
  end
end
