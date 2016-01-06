# -*- encoding: utf-8 -*-
# stub: chef-vault 2.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "chef-vault"
  s.version = "2.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kevin Moser"]
  s.date = "2014-07-17"
  s.description = "Data encryption support for Chef using data bags"
  s.email = ["kevin.moser@nordstrom.com"]
  s.executables = ["chef-vault"]
  s.files = ["bin/chef-vault"]
  s.homepage = "https://github.com/Nordstrom/chef-vault"
  s.licenses = ["Apache License, v2.0"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Data encryption support for Chef using data bags"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<chef>, ["~> 11.12"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<chef>, ["~> 11.12"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<chef>, ["~> 11.12"])
  end
end
