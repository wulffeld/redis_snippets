class RedisSnippets::SnippetsController < ApplicationController
  include RedisSnippets::Util

  before_action :redis_snippets_authenticate_admin_user!

  layout 'admin'

  def show
  end

  def update
    params[:snippets].each do |key, content|
      SnippetStoreService.update(snippet_key(key), params[:snippets][key])
    end

    flash[:notice] = 'Snippets updated.'
    redirect_to redis_snippets.snippets_path
  end

  protected

  def redis_snippets_authenticate_admin_user!
    if respond_to?(:authenticate_admin_user!)
      authenticate_admin_user!
    end
  end
end
