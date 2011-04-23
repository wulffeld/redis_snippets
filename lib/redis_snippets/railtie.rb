module RedisSnippets
  class Railtie < Rails::Railtie
    # This shouldn't be required when 3.1 arrives.
    # https://github.com/drogus/rails_helpers_fix
    initializer "redis_snippets.include_railties_helpers_fix" do
      helpers_paths = []
      Rails.application.railties.all do |r|
        if r.config.respond_to?(:paths) && r.config.paths.app.helpers
          helpers_paths += r.config.paths.app.helpers.to_a
        end
      end

      ActiveSupport.on_load(:action_controller) do
        config.helpers_path += helpers_paths
      end
    end
  end
end
