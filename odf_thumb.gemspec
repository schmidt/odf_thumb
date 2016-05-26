# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odf_thumb/version'

Gem::Specification.new do |spec|
  spec.name          = "odf_thumb"
  spec.version       = OdfThumb::VERSION
  spec.authors       = ["Gregor Schmidt"]
  spec.email         = ["schmidt@nach-vorne.eu"]

  spec.summary       = %q{odf_thumb extracts existing thumbnail files from OpenDocument files.}
  spec.homepage      = "https://github.com/schmidt/odf_thumb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["odf_thumb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rubyzip", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
