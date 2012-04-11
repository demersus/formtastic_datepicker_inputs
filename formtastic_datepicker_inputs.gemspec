Gem::Specification.new do |s|
  s.name = %q{formtastic_datepicker_inputs}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alan Harper"]
  s.date = %q{2010-11-30}
  s.description = %q{Use jQuery UI's date picker with formtastic easily}
  s.email = %q{alan@appfission.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = Dir.glob("lib/**/*.rb") + [
    "MIT-LICENSE",
    "README.markdown",
    "Rakefile",
    "init.rb"
  ]
  s.homepage = %q{http://github.com/aussiegeek/formtastic_datepicker_inputs}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Use jQuery UI's date picker with formtastic easily}
  s.test_files = Dir.glob("spec/**/*.rb")

  s.add_dependency(%q<activesupport>, [">= 3.1.4"])
  s.add_dependency(%q<actionpack>, [">= 3.1.4"])
  s.add_dependency(%q<i18n>, [">= 0.4.0"])
  s.add_dependency(%q<formtastic>, [">= 2.0.0"])
  
  s.add_development_dependency(%q<rails>, [">= 3.1.4"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
  s.add_development_dependency(%q<rspec-rails>, [">= 2.9.0"])
  s.add_development_dependency(%q<rspec_tag_matchers>, [">= 1.0.0"])
  s.add_development_dependency(%q<hpricot>, [">= 0.8.3"])
end

