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

desc "New release"
task :new_release do |t|
  `rake version:bump:patch`  # Updates VERSION.
  `rake gemspec`
  `git commit -am "Preparing new release."`
  `rm -f pkg/*`
  `rake build`
  `rake rubygems:release`
end
