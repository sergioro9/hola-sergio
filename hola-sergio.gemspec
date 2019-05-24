lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hola-sergio/version"

Gem::Specification.new do |s|
    s.name         = 'hola-sergio'
    s.version      = Hola::VERSION
    s.date         = '2019-05-23'
    s.summary      = 'A simple hello world gem, from a very special man'
    s.authors      = ['Sergio Romero']
    s.email        = 'sergioro@nmsu.edu'
    s.homepage     = 'https://github.com/sergioro9/hola-sergio'
    s.files        = Dir.glob("{bin,lib,man}/**/*") + %w( README.md Rakefile LICENSE )
    s.executables << 'hola'
    s.description  = <<desc
    If you would be a real seeker after truth,
    it is necessary that at least once in your life you doubt,
    as far as possible, all things
desc
    s.license      = 'wtfpl'
end
