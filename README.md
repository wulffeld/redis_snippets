# Redis Snippets

## Background

Easily store snippets of content in Redis.

## How

It's a Rails 3 engine so add redis-snippets to your Gemfile and put this in an initializer:

``` ruby
App::Application.config.redis_snippets = {
  :connection => ::Redis::Namespace.new("my_namespace", :redis => ::Redis.new),
  :keys => [:key1, :key2]
}
```

You should then be able to access /admin/snippets/.

In your views use helper snippet().

``` ruby
<%= snippet(:key1) %>
```

## Multi Site

If you're using one app to serve multiple sites a little more configuration is necessary.

``` ruby
App::Application.config.redis_snippets = {
  :connection => ::Redis::Namespace.new("my_namespace", :redis => ::Redis.new),
  :multi_site => true,
  :keys => [:key1, :key2]
}
```

And add this method to your ApplicationController:

``` ruby
helper_method :redis_snippet_site_key
def redis_snippet_site_key
  request.host
end
```

## Requirements

* redis
* redis-namespace