class Admin::SnippetsController < AdminController
  def index
  end

  def update
    params[:snippets].each do |key, content|
      RedisSnippets::Snippets.update(key.to_sym, params[:snippets][key])
    end
    
    flash[:notice] = 'Snippets updated.'
    redirect_to admin_snippets_path
  end
end
