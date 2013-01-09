class RedisSnippets::SnippetsController < ApplicationController
  include RedisSnippets::Help
  
  if respond_to?(:authenticate_admin_user!)
    before_filter :authenticate_admin_user!
  end
  
  layout 'admin'

  def show
  end

  def update
    params[:snippets].each do |key, content|
      raise "#{key} not in the specified keys." unless RedisSnippets::Engine.config.redis_snippets[:keys].include?(key.to_sym)
      RedisSnippets::Snippets.update(snippet_key(key), params[:snippets][key])
    end
  
    flash[:notice] = 'Snippets updated.'
    redirect_to redis_snippets.snippets_path
  end
end
