# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{liquid-inheritance}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Webb"]
  s.date = %q{2009-04-09}
  s.description = %q{Adds Django style template inheritance to Liquid}
  s.email = %q{dan@danwebb.net}
  s.extra_rdoc_files = ["CHANGELOG", "lib/liquid_inheritance.rb", "lib/tags/block.rb", "lib/tags/extends.rb", "LICENSE", "README.textile"]
  s.files = ["CHANGELOG", "lib/liquid_inheritance.rb", "lib/tags/block.rb", "lib/tags/extends.rb", "LICENSE", "liquid-inheritance.gemspec", "Manifest", "Rakefile", "README.textile", "test/liquid_inheritance_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/danwrong/liquid-inheritance/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Liquid-inheritance", "--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{liquid-inheritance}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Adds Django style template inheritance to Liquid}
  s.test_files = ["test/liquid_inheritance_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
