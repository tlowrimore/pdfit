require_relative 'lib/pdfuckit/version'

Gem::Specification.new do |spec|
  spec.name          = "pdfuckit"
  spec.version       = Pdfuckit::VERSION
  spec.authors       = ["tlowrimore"]
  spec.email         = ["tlowrimore@coroutine.com"]

  spec.summary       = %q{Fuck it, just put it in a PDF.}
  spec.description   = %q{Fuck it, just put it in a PDF.}
  spec.homepage      = "https://coroutine.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
