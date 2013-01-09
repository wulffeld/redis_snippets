# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "redis_snippets"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Moen Wulffeld"]
  s.date = "2013-01-09"
  s.description = ""
  s.email = "martin@wulffeld.org"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
    "Rakefile",
    "VERSION",
    "app/assets/redis_snippets/redis_snippets.sass",
    "app/controllers/redis_snippets/snippets_controller.rb",
    "app/helpers/redis_snippets/snippets_helper.rb",
    "app/models/redis_snippets/snippets.rb",
    "app/views/redis_snippets/snippets/show.html.erb",
    "config/routes.rb",
    "lib/redis_snippets.rb",
    "lib/redis_snippets/engine.rb",
    "lib/redis_snippets/help.rb",
    "lib/redis_snippets/redis.rb",
    "redis_snippets.gemspec"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "View snippets held in Redis storage."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, [">= 0"])
      s.add_runtime_dependency(%q<redis-namespace>, [">= 0"])
    else
      s.add_dependency(%q<redis>, [">= 0"])
      s.add_dependency(%q<redis-namespace>, [">= 0"])
    end
  else
    s.add_dependency(%q<redis>, [">= 0"])
    s.add_dependency(%q<redis-namespace>, [">= 0"])
  end
end

