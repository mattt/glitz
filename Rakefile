require "bundler"
Bundler.setup

gemspec = eval(File.read("glitz.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["glitz.gemspec"] do
  system "gem build glitz.gemspec"
  system "gem install glitz-#{Glitz::VERSION}.gem"
end
