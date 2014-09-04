# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nnmClub_api/version"

Gem::Specification.new do |spec|
  spec.name          = "nnmClub_api"
  spec.version       = NnmClubApi::VERSION
  spec.authors       = ["Baranov Sergey"]
  spec.email         = ["sergey@drummer.ru"]
  spec.summary       = %q{NNM-Club torrent-tacker parser.}
  spec.description   = %q{Gem for parsing NoNaMe Club torrent-tracker.}
  spec.homepage      = "https://github.com/gemoroy/nnmClub_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency "mechanize", "2.7.2"
end
