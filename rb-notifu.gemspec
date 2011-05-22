# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rb-notifu/version"

Gem::Specification.new do |s|
  s.name        = "rb-notifu"
  s.version     = Notifu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["stereobooster"]
  s.email       = ["stereobooster@gmail.com"]
  s.homepage    = "http://github.com/stereobooster/rb-notifu"
  s.summary     = %q{Notification system for windows. Trying to be Growl}
  s.description = %q{Notification system for windows. Trying to be Growl. Ruby wrapper around notifu (http://www.paralint.com/projects/notifu/index.html)}
  s.date = %q{2011-05-20}

  s.rubyforge_project = "rb-notifu"

  s.files = [
    "README.md",
    "Rakefile",
    "lib/rb-notifu.rb",
    "lib/rb-notifu/version.rb",
    "rb-notifu.gemspec",
    "bin/notifu.exe",
    "bin/notifu64.exe"
  ]
  #s.executables   = ["notifu.exe", "notifu64.exe"]
  s.require_paths = ["lib"]
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  
end
