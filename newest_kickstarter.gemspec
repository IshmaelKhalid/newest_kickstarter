# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newest_kickstarter/version'

Gem::Specification.new do |spec|
  spec.name          = "newest_kickstarter"
  spec.version       = NewestKickstarter::VERSION
  spec.authors       = ["IshmaelKhalid"]
  spec.email         = ["ishmaelkhalid@icloud.com"]

  spec.summary       = %q{Scrapes top 20 new projects from kickstarter.com, an gives more info on each.}
  spec.description   = %q{This ruby gem is a simple command line interface (CLI) to access the top 20 newest projects on Kickstarter.com.This gem also allows you to recieve basic information about those projects and a link to their project page.}
  spec.homepage      = "https://github.com/IshmaelKhalid/newest_kickstarter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["newest-kickstarter"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
