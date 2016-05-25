# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'connect_gsi_api/version'

Gem::Specification.new do |spec|
  spec.name          = "connect_gsi_api"
  spec.version       = ConnectGsiApi::VERSION
  spec.authors       = ["Yasuhiro Matsumura"]
  spec.email         = ["ym.works1985@gmail.com"]

  spec.summary       = %q{緯度・経度を入力値に、国土地理院提供のAPI経由で二点間の距離を算出します。}
  spec.description   = %q{本gemは、一回のリクエストで、一回だけ国土地理院提供のAPIを叩きます。APIの使用回数上限については、国土地理院が提示しているAPI利用規約を参照してください。また、APIの仕様上、日本の緯度・経度にしか対応していません。}
  spec.homepage      = "http://muramurasan.hatenablog.jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
