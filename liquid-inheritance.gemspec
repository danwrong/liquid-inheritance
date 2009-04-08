# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{liquid-inheritance}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Webb"]
  s.date = %q{2009-04-08}
  s.description = %q{Adds Django style template inheritance to Liquid}
  s.email = %q{dan@danwebb.net}
  s.extra_rdoc_files = ["CHANGELOG", "lib/liquid_inheritance.rb", "LICENSE", "README"]
  s.files = ["CHANGELOG", "lib/liquid_inheritance.rb", "LICENSE", "Rakefile", "README", "Manifest", "liquid-inheritance.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/danwrong/liquid-inheritance/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Liquid-inheritance", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{liquid-inheritance}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Adds Django style template inheritance to Liquid}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<liquid>, [">= 0", "= 1.9.0"])
    else
      s.add_dependency(%q<liquid>, [">= 0", "= 1.9.0"])
    end
  else
    s.add_dependency(%q<liquid>, [">= 0", "= 1.9.0"])
  end
end
