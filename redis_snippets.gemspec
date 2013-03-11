lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_snippets/version'

Gem::Specification.new do |spec|
  spec.name          = "redis_snippets"
  spec.version       = RedisSnippets::VERSION
  spec.authors       = ["Martin Moen Wulffeld"]
  spec.email         = ["martin@wulffeld.org"]
  spec.description   = %q{Storing snippets of whatever in Redis.}
  spec.summary       = %q{Storing snippets of whatever in Redis.}
  spec.homepage      = "http://www.wulffeld.org/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3.2"
  spec.add_development_dependency "rake"

  spec.add_dependency "redis",           ">= 2.0.0"
  spec.add_dependency "redis-namespace", ">= 1.2.1"
end
