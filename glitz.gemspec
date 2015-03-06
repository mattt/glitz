# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "glitz/version"

Gem::Specification.new do |s|
  s.name        = "Glitz"
  s.authors     = ["Mattt Thompson"]
  s.license     = "MIT"
  s.email       = "m@mattt.me"
  s.homepage    = "http://github.com/mattt/glitz"
  s.version     = Glitz::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Glitz"
  s.description = "ANSI-Colorized Glamour for Terminal Output"

  s.add_development_dependency "rake"

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
