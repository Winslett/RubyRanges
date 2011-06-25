# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_ranges/version"

Gem::Specification.new do |s|
  s.name        = "RubyRanges"
  s.version     = RubyRanges::VERSION
  s.authors     = ["Chris Winslett"]
  s.email       = ["christopherwinslett@gmail.com"]
  s.homepage    = "https://github.com/Winslett/RubyRanges"
  s.summary     = %q{Allows array type actions on ranges and arrays of ranges}
  s.description = %q{See https://github.com/Winslett/RubyRanges}

  s.rubyforge_project = "RubyRanges"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
