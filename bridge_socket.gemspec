# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bridge_socket/version'

Gem::Specification.new do |spec|
  spec.name          = "bridge_socket"
  spec.version       = BridgeSocket::VERSION
  spec.authors       = ["Toshiyuki Suzumura"]
  spec.email         = ["suz.labo@amail.plala.or.jp"]

  spec.summary       = %q{Bridge character device or socket.}
  spec.description   = %q{Bridge character device or socket.
                          ex: physical serial device and VMWareFusion's virtual serial port.}
  spec.homepage      = "https://github.com/suzumura-ss/bridge_socket"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "daemon-spawn", "~> 0.4"
end
