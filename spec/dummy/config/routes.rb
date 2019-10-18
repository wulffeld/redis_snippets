Rails.application.routes.draw do
  mount RedisSnippets::Engine, at: "admin", as: "redis_snippets"
end
