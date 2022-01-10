# frozen_string_literal: true

require_relative "lib/primer_form_builder/version"

REQUIRED_RAILS_VERSION = ">= 5.2"

Gem::Specification.new do |spec|
  spec.name          = "primer_form_builder"
  spec.version       = PrimerFormBuilder::VERSION
  spec.authors       = ["Danger Science Group"]
  spec.email         = ["opensource@dangerscience.com"]

  spec.summary       = "Build forms with Primer markup using Rails form builders."
  spec.homepage      = "https://dangerscience.github.io"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dangerscience/primer_form_builder"
  spec.metadata["changelog_uri"] = "https://github.com/dangerscience/primer_form_builder/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", REQUIRED_RAILS_VERSION
  spec.add_dependency "activesupport", REQUIRED_RAILS_VERSION
end
