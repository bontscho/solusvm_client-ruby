# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solusvm_client/version'

Gem::Specification.new do |spec|
  spec.name          = "solusvm_client"
  spec.version       = SolusvmClient::VERSION
  spec.authors       = ["bontscho"]
  spec.email         = ["software@bontscho.de"]
  spec.summary       = %q{Hello World}
  spec.description   = %q{Hello World}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
