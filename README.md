# Redis Snippets

## Background

Easily store snippets of content in Redis. Inspired by plugin for Wordpress named Snippets.

With redis_snippets you could for instance store ad code like Adsense or other HTML/JS content.

## How

It's a Rails engine so add redis-snippets to your Gemfile and put this in an initializer:

``` ruby
App::Application.config.redis_snippets = {
  connection: ::Redis::Namespace.new("my_namespace", redis: ::Redis.new),
  keys: [:key1, :key2]
}
```

The names of the keys are entirely up to you.

You should then be able to access /admin/snippets/.

In your views use helper snippet().

``` ruby
<%= snippet(:key1) %>
```

### Random snippets

One snippet area can include multiple snippets if you separate them with a

```
[section]
```

The snippet helper will randomly select the snippet. This is convenient for ad delivery for example.

## Multi Site

If you're using one app to serve multiple sites a little more configuration is necessary.

``` ruby
App::Application.config.redis_snippets = {
  connection: ::Redis::Namespace.new("my_namespace", redis: ::Redis.new),
  multi_site: true,
  keys: [:key1, :key2]
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

* rails 5.x or higher
* redis
* redis-namespace
