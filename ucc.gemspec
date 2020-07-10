lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ucc/version"

Gem::Specification.new do |spec|
  spec.name          = "ucc"
  spec.version       = Ucc::VERSION
  spec.authors       = ["DmitriyMalayev"]
  spec.email         = ["dmitriy.malayev@gmail.com"]

  spec.summary       = %q{Urgent Care Center Finder}
  spec.description   = %q{Urgent Care Center FInder Based On Location}
  spec.homepage      = "https://github.com/DmitriyMalayev/ucc"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/DmitriyMalayev/ucc"
  spec.metadata["changelog_uri"] = "https://github.com/DmitriyMalayev/ucc/changelog.md"  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = ["ucc"]
  spec.require_paths = ["lib"]
  spec.add_dependency "tty-prompt" 
  spec.add_dependency "http"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "pry"
end

#Our gems rely on other gems and we put those here 
#We run "bundle install after adding" 
#We have added http gem in this example 

#gemspec 
  #What other gems depend on. 
  #Specifies what other gems get installed when you install this gem. 

#gemfile 
  #specific dependencies for a project. 
  #Determines what happens when you run bundle install 