module RedisSnippets
  module Util
    # If multi_site is true the symbol returned will have the key returned with a prefix.
    # This prefix is defined in your application using the redis_snippet_site_key method.
    # redis_snippet_site_key should simply return a unique string per site. For instance
    # it could be the domain of the site.
    def snippet_key(key)
      s = RedisSnippets::Engine.config.redis_snippets[:multi_site] ? redis_snippet_site_key + ':' : ''
      s << key.to_s
      s.to_sym
    end
  end
end
