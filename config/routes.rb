RedisSnippets::Engine.routes.draw do
  resource :snippets, controller: 'snippets', only: [:show, :update]
end
