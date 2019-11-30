# Redis Snippets

[![Version](https://img.shields.io/gem/v/redis_snippets.svg?style=flat-square)](https://rubygems.org/gems/redis_snippets)
[![Build](https://img.shields.io/travis/wulffeld/redis_snippets.svg?style=flat-square)](https://travis-ci.org/wulffeld/redis_snippets)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/wulffeld/redis_snippets?style=flat-square)](https://codeclimate.com/github/wulffeld/redis_snippets)
[![Coverage](https://img.shields.io/codeclimate/coverage/wulffeld/redis_snippets?style=flat-square)](https://codeclimate.com/github/wulffeld/redis_snippets)

## Background

Easily store snippets of content in Redis. Inspired by plugin for Wordpress
named Snippets.

With redis_snippets you could for instance store AdSense code snippets or
other HTML/JS content.

## Requirements

Gems:

* rails 5.x or higher
* redis
* redis-namespace

## Installation

Add to your Rails projects Gemfile and bundle install:

```
gem "redis_snippets"
```

## Usage

It's a Rails engine so add redis-snippets to your Gemfile and put this in an
initializer:

``` ruby
Rails.application.config.redis_snippets = {
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

The snippet helper will randomly select the snippet. This is convenient for ad
delivery or perhaps A/B testing 🤷‍♂.

## Multi Site

If you're using one app to serve multiple sites a little more configuration is
necessary.

``` ruby
Rails.application.config.redis_snippets = {
  connection: ::Redis::Namespace.new("my_namespace", redis: ::Redis.new),
  multi_site: true,
  keys: [:key1, :key2],
  transform: "MySnippetTransform"
}
```

## Transforming Snippets

Sometimes you might want to transform snippets. This happens after
randomization so you get the actual snippet content to be rendered passed to
your transform class.

The transform class must respond to .transforms? and #transform. Example:

``` ruby
class MySnippetTransform
  def initialize(content:, key:)
    @content = content
    @key = key
  end

  # Must return content.
  def transform
    @content.gsub("Amazon", "Etsy")
  end

  class << self
    def transforms?(key:)
      key == :advert_header
    end
  end
end
```

I personally use this to insert special CSS code for AdSense. This saves me
from having to do this manually whenever I update it or add it.

``` ruby
Rails.application.config.redis_snippets = {
  connection: ::Redis::Namespace.new("my_namespace", redis: ::Redis.new),
  multi_site: true,
  keys: [:key1, :key2],
  transform: "MySnippetTransform"
}
```

And add this method to your ApplicationController:

``` ruby
helper_method :redis_snippet_site_key
def redis_snippet_site_key
  request.host
end
```
