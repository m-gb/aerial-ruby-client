
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aerial_ruby_client/version"

Gem::Specification.new do |spec|
  spec.name                  = "aerial_ruby_client"
  spec.version               = AerialRubyClient::VERSION
  spec.authors               = ["m-gb"]
  spec.email                 = ["maya.goldberg90@gmail.com"]

  spec.summary               = "Aerial Apple TV video downloader"
  spec.description           = "A simple gem that downloads the Aerial Apple TV videos and saves them to a given directory."
  spec.homepage              = "http://rubygems.org/gems/aerial_ruby_client"
  spec.license               = "MIT"

  spec.files                 = ["lib/aerial_ruby_client.rb"]

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency "bundler",  "~> 1.16"
  spec.add_dependency "rake",     "~> 10.0"
  spec.add_dependency "httparty", "~> 0.15.6"
  spec.add_dependency "json",     "~> 2.1"
end
