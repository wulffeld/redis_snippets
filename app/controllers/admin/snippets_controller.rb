class Admin::SnippetsController < AdminController
  include RedisSnippets::Help
  
  def index
  end

  def update
    params[:snippets].each do |key, content|
      raise "#{key} not in the specified keys." unless RedisSnippetsEngine.config.redis_snippets[:keys].include?(key.to_sym)
      RedisSnippets::Snippets.update(snippet_key(key), params[:snippets][key])
    end
    
    flash[:notice] = 'Snippets updated.'
    redirect_to admin_snippets_path
  end
end
