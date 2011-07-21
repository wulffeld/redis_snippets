# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redis_snippets}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Martin Moen Wulffeld}]
  s.date = %q{2011-07-21}
  s.description = %q{}
  s.email = %q{martin@wulffeld.org}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "README",
    "Rakefile",
    "VERSION",
    "app/controllers/admin/snippets_controller.rb",
    "app/helpers/redis_snippets/snippets_helper.rb",
    "app/models/redis_snippets/snippets.rb",
    "app/views/admin/snippets/show.html.erb",
    "config/routes.rb",
    "lib/redis_snippets.rb",
    "lib/redis_snippets/railtie.rb",
    "lib/redis_snippets/redis.rb",
    "redis_snippets.gemspec"
  ]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{View snippets held in Redis storage.}

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

