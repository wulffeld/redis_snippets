require 'redis'
require 'redis/namespace'

class RedisSnippetsEngine < ::Rails::Engine
  engine_name :redis_snippets
end

require 'redis_snippets/railtie'
require 'redis_snippets/redis'
