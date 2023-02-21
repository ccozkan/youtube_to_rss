require_relative 'lib/youtube_to_rss/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_to_rss"
  spec.version       = YoutubeToRss::VERSION
  spec.authors       = ["C Çağrı Özkan"]
  spec.email         = ["ccozkan@gmail.com"]

  spec.summary       = "Converts youtube channel addresses to rss links"
  spec.description   = ""
  spec.homepage      = "https://github.com/ccozkan/youtube_to_rss"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ccozkan/youtube_to_rss"

  spec.add_dependency "rest-client"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
