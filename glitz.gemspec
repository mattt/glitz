require File.expand_path("../lib/glitz/version", __FILE__)

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

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "*.rdoc"]
  s.require_path  = 'lib'
end
