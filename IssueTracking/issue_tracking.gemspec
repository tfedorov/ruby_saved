$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "issue_tracking/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "issue_tracking"
  s.version     = IssueTracking::VERSION
  s.authors     = ["Taras Fedorov"]
  s.email       = ["t.fedorov.s@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of IssueTracking."
  s.description = "TODO: Description of IssueTracking."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
