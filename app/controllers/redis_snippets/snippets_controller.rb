class RedisSnippets::SnippetsController < ApplicationController
  include RedisSnippets::Help

  # Temporary fix for Rails 6.0 support. Rendering views doesn't have access
  # to the apps routes unless we include them.
  include Rails.application.routes.url_helpers

  before_action :redis_snippets_authenticate_admin_user!

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

  protected

  def redis_snippets_authenticate_admin_user!
    if respond_to?(:authenticate_admin_user!)
      authenticate_admin_user!
    end
  end
end
