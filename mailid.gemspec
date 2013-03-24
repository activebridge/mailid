$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mailid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mailid"
  s.version     = Mailid::VERSION
  s.authors     = ["TODO: Pavel Mihailovskiy"]
  s.email       = ["TODO: pavel.mihailovskiy@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Mailid."
  s.description = "TODO: Description of Mailid."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_development_dependency "rspec-rails"
end
