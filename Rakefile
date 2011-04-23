require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name           = "redis_snippets"
    gem.summary        = "View snippets held in Redis storage."
    gem.description    = ""
    gem.email          = "martin@wulffeld.org"
    gem.authors        = ["Martin Moen Wulffeld"]
    gem.add_dependency(%q<redis>)
    gem.add_dependency(%q<redis-namespace>)
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
