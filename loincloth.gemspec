# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{loincloth}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Enrique García Cota"]
  s.date = %q{2011-06-10}
  s.description = %q{Have you ever wanted to parse a subset of markdown, in a very innefficient way? Well, now you can!}
  s.email = %q{kikito@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/loincloth.rb",
    "lib/loincloth/block.rb",
    "lib/loincloth/block_parser.rb",
    "loincloth.gemspec",
    "run_tests.rb",
    "test/helper.rb",
    "test/loincloth/block/emphasize.rb",
    "test/loincloth/block/imaginize.rb",
    "test/loincloth/block/is_h1.rb",
    "test/loincloth/block/is_h2.rb",
    "test/loincloth/block/is_list.rb",
    "test/loincloth/block/is_paragraph.rb",
    "test/loincloth/block/link.rb",
    "test/loincloth/block/process.rb",
    "test/loincloth/block/strongize.rb",
    "test/loincloth/block/to_h1.rb",
    "test/loincloth/block/to_h2.rb",
    "test/loincloth/block/to_list.rb",
    "test/loincloth/block/to_paragraph.rb",
    "test/loincloth/block_parser/each_block.rb",
    "test/loincloth/to_html.rb"
  ]
  s.homepage = %q{http://github.com/kikito/loincloth}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Like redcloth or bluecloth, but worse}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

