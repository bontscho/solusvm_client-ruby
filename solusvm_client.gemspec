# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solusvm_client/version'

Gem::Specification.new do |spec|
  spec.name          = "solusvm_client"
  spec.version       = SolusvmClient::VERSION
  spec.authors       = ["bontscho"]
  spec.email         = ["software@bontscho.de"]
  spec.summary       = %q{SolusVM Client API Implementation}
  spec.description   = %q{This Gem implements the SolusVM Client API (http://docs.solusvm.com/client_api) to easily manage your Virtual Private Servers}
  spec.homepage      = "https://github.com/bontscho/solusvm_client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '~> 4'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency 'rake', '~> 10'
end
