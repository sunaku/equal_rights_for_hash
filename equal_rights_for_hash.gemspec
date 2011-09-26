# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "equal_rights_for_hash/version"

Gem::Specification.new do |s|
  s.name        = "equal_rights_for_hash"
  s.version     = EqualRights::VERSION
  s.authors     = ["Suraj N. Kurapati"]
  s.email       = ["sunaku@gmail.com"]
  s.homepage    = "http://redmine.ruby-lang.org/issues/5008"
  s.summary     = %q{Adds Kernel#Hash() and generic #to_h() methods.}
  s.description = %q{Grants equal rights for Hash like other Ruby data
                     structures: Array, String, Integer, and Float.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
