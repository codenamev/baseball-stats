# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baseball_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "codenamev-baseball-stats"
  spec.version       = BaseballStats::VERSION
  spec.authors       = ["Valentino Stoll"]
  spec.email         = ["valentino@reenhanced.com"]
  spec.description   = %q{Generates baseball player statistics}
  spec.summary       = %q{Generates baseball player statistics}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.1.6"
  spec.add_dependency "active_record_migrations", "~> 4.1.6.1"
  spec.add_dependency "sqlite3", "~> 1.3.9"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda-matchers"
end
