require "English"
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tmdb/version"

Gem::Specification.new do |spec|
  spec.name                  = "tmdb-client"
  spec.version               = Tmdb::VERSION
  spec.authors               = %w[dcoo]
  spec.email                 = %w[danieljohncoo@gmail.com]

  spec.summary               = "The Movie Database API Client"
  spec.description           = "The Movie Database Enterprise API Client"
  spec.homepage              = "https://github.com/DC00/tmdb-client"
  spec.license               = "MIT"

  spec.files                 = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables           = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files            = spec.files.grep(%/^(test|spec|features)\//)
  spec.require_paths         = %w[lib]
  spec.bindir                = "bin"

  spec.add_dependency "activesupport"
  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
