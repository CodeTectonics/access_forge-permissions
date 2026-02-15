# frozen_string_literal: true

require_relative "lib/access_forge/permissions/version"

Gem::Specification.new do |spec|
  spec.name = "analytics_plane"
  spec.version = AccessForge::Permissions::VERSION
  spec.authors = ["Mark Harbison"]
  spec.email = ["mark@tyne-solutions.com"]

  spec.summary = "A persistence-backed AccessForge implementation for permission based authorisation."
  spec.description = "A persistence-backed AccessForge implementation for permission based authorisation."
  spec.homepage = "https://github.com/CodeTectonics/access_forge-permissions"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.1"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.21"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
