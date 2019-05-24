Gem::Specification.new do |s|
    s.name = 'hola-sergio'
    s.version = '0.0.1'
    s.date = '2010-04-28'
    s.summary = 'A simple hello world gem, from a very special man'
    s.authors = ['Sergio Romero']
    s.email = 'sergioro@nmsu.edu'
    s.homepage = 'http://rubygems.org/gem/hola-sergio'
    s.files = Dir.glob("{bin,lib,man}/**/*") + %w( README.md Rakefile LICENSE )
    s.executables << 'hola'
    s.description = <<desc
    If you would be a real seeker after truth,
    it is necessary that at least once in your life you doubt,
    as far as possible, all things
desc
    s.license = 'wtfpl'
end
