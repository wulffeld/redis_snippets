lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_snippets/version'

Gem::Specification.new do |spec|
  spec.name          = "redis_snippets"
  spec.version       = RedisSnippets::VERSION
  spec.authors       = ["Martin Moen Wulffeld"]
  spec.email         = ["martin@wulffeld.org"]
  spec.summary       = %q{Storing snippets of HTML, text, etc. in Redis for use in views.}
  spec.description   = %q{A Ruby on Rails gem that facilitates fast retrieval of snippets of code or information for views.}
  spec.homepage      = "https://github.com/wulffeld/redis_snippets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3.2"
  spec.add_development_dependency "rake"

  spec.add_dependency "rails",           ">= 5"
  spec.add_dependency "redis",           ">= 2.0.0"
  spec.add_dependency "redis-namespace", ">= 1.2.1"
end
