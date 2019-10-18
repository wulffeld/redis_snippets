class SnippetStoreService
  class << self
    def update(key, content)
      ensure_key_is_defined!(key)
      RedisSnippets::Redis.set("snippets:#{key}", content)
    end

    def del(key)
      ensure_key_is_defined!(key)
      RedisSnippets::Redis.del("snippets:#{key}")
    end

    # Retrieve snippet.
    def method_missing(method, *args)
      RedisSnippets::Redis.get("snippets:#{method}")
    end

    protected

    def ensure_key_is_defined!(key)
      raise UndefinedSnippetsKey.new("#{key} not in the specified keys.") unless RedisSnippets::Engine.config.redis_snippets[:keys].include?(key.to_sym)
    end
  end
end
