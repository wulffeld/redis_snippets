class RedisSnippets::Snippets
  class << self
    def update(key, content)
      RedisSnippets::Redis.set("snippets:#{key}", content)
    end

    def del(key)
      RedisSnippets::Redis.del("snippets:#{key}")
    end

    # Retrieve snippet.
    def method_missing(method, *args)
      RedisSnippets::Redis.get("snippets:#{method}")
    end
  end
end
