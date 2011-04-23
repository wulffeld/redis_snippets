class RedisSnippets::Snippets
  class << self
    def update(key, content)
      raise "#{key} not in the specified keys." unless RedisSnippetsEngine.config.redis_snippets[:keys].include?(key)
      RedisSnippets::Redis.set("snippets:#{key}", content)
    end

    def del(key)
      RedisSnippets::Redis.del("snippets:#{key}")
    end

    # Retrieve snippet.
    def method_missing(method, *args)
      raise "#{method} not in the specified keys." unless RedisSnippetsEngine.config.redis_snippets[:keys].include?(method.to_sym)
      RedisSnippets::Redis.get("snippets:#{method}")
    end
  end
end
