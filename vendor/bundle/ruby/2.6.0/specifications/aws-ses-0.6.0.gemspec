# -*- encoding: utf-8 -*-
# stub: aws-ses 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "aws-ses".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Drew Blas".freeze, "Marcel Molina Jr.".freeze]
  s.date = "2014-10-13"
  s.description = "Client library for Amazon's Simple Email Service's REST API".freeze
  s.email = "drew.blas@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.erb".freeze, "README.rdoc".freeze, "TODO".freeze]
  s.files = ["LICENSE".freeze, "README.erb".freeze, "README.rdoc".freeze, "TODO".freeze]
  s.homepage = "http://github.com/drewblas/aws-ses".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Client library for Amazon's Simple Email Service's REST API".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<builder>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mail>.freeze, ["> 2.2.5"])
      s.add_development_dependency(%q<shoulda-context>.freeze, [">= 0"])
      s.add_development_dependency(%q<flexmock>.freeze, ["~> 0.8.11"])
    else
      s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_dependency(%q<builder>.freeze, [">= 0"])
      s.add_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_dependency(%q<mail>.freeze, ["> 2.2.5"])
      s.add_dependency(%q<shoulda-context>.freeze, [">= 0"])
      s.add_dependency(%q<flexmock>.freeze, ["~> 0.8.11"])
    end
  else
    s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
    s.add_dependency(%q<builder>.freeze, [">= 0"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_dependency(%q<mail>.freeze, ["> 2.2.5"])
    s.add_dependency(%q<shoulda-context>.freeze, [">= 0"])
    s.add_dependency(%q<flexmock>.freeze, ["~> 0.8.11"])
  end
end
