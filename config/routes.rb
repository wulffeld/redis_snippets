RedisSnippets::Engine.routes.draw do
  resource :snippets, controller: 'redis_snippets/snippets', only: [:show, :update]
end
