# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runningfile_parse/version'

Gem::Specification.new do |spec|
  spec.name          = "runningfile_parse"
  spec.version       = RunningfileParse::VERSION
  spec.authors       = ["liwenjie"]
  spec.email         = ["scaluo@gmail.com"]
  spec.description   = %q{parse running file,support tcx}
  spec.summary       = %q{parse running file,support tcx}
  spec.homepage      = "https://github.com/scaluo/runningfile_parse.git"
  spec.license       = "MIT"
  #Dir["{lib/**/*,spec/*}"] + %w{README}
  spec.files         = Dir["{lib/**/*}"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
