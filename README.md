make your own gem https://guides.rubygems.org/make-your-own-gem/  [gem1]
-it is a convention to use dashes instead of underscores for gem names
(as you can see by searching for these two symbols in rubygems.org)
-Code for your package is placed within the ./lib . the convention is to
have one ruby file with the *same* name as your gem, since that gets
loaded when
    require 'gem-name'
is run. That one file will define *all* your setup and API
-the .gemspec defines what's in the gem, who made it, and its version.
it is also your *interface* to RubyGems.org. *all* the info you see on a
gem page comes from the gemspec. the order of the fields dont matter but
it is a convention to at least include these information
    s.name
    s.version
    s.date
    s.summary
    s.homepage
    s.email
    s.authors
    s.files
    s.descrition
-The description can be as long as you want. if it matches /^== [A-Z]/
then the description will be run through RDoc's markup formatter for
display on rubygems.org. be aware that other consumers of the data might
not understand markup
-two examples of how to add files in your gemspec [1]:
    s.files = ['lib/hola-sergio.rb']
    s.files = Dir.glob("{bin,lib,man}/**/*") + %w( README.md Rakefile LICENSE )
the first one only includes a single file in your gem. the second
includes many files. the second one is superior, and is called *dynamic
gemspec*.
-note how we use Dir.glob above. the *powerful* thing about gemspec is
that it is all ruby, so you can wrap scripts to generate the file names
and bump the version number. there are many fileds the gemspec can contain.
-after you created a gemspec, you can build a gem from it. then you can
install the generated gem locally to test it:
    gem build gem-name.gemspec
    gem install ./gem-name-0.0.0.gem
-Now you can share your gem with the rest of the Ruby community.
Publishing your gem out to RubyGems.org only takes one command, provided
that you have an account on the site. To setup your computer with your
RubyGems account:
    $ curl -u sergioro https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
    Enter host password for user 'sergioro':
Alternatively might want to simply try entering the above URL in your
browser’s address bar. Your browser will ask you to login to rubygems.org
Enter your username and password. Your browser will now try to download
the file api_key.yaml. Save it in ~/.gem and call it ‘credentials’
-now you can push out the gem:
    gem push gem-name-0.0.0.gem
-having everything in one file doesn' scale well, so distribute your
source code in several files. the gem's root file is in charge of
loading code for the gem. the other files for a gem are usually placed
in a directory of the same name of the gem inside of `lib`. *important*
if you add new files to your gem dont forget to add them in the gemspec.
To automate the updating of gemspec you can use any of Rake, Bundler,
Hoe, Jeweler, or just a *dynamc gemspec* see [1] above
-when testing ruby gems in `irb` you should include the `-Ilib` flag
like so:
    irb -Ilib -rmy-gem
this is so b/c RubyGems includes the lib directory for you, so end users
don’t need to worry about configuring their load paths. However, if
you’re running the code outside of RubyGems, you have to configure
things yourself. It’s possible to manipulate the $LOAD_PATH from within
the code itself, but that’s considered an anti-pattern in most cases.
-gems can also expose one or many executables file to your shell's PATH.
examples are `rake` and `prettify_json.rb`.
-adding an executable is easy, you just need to place the file in your
gem's `bin` directory and add it to the list oof executables in gemspec:
    mkdir bin
    touch bin/hola
    chmod a+x bin/hola
-finally to get hola's executable included when you push the gem, add it
in the gemspec:
    s.executables << 'hola'
this will create a commandl ine utility in the user's `~/bin/` directory.
you can add more executables in your gem's bin directory if you need to,
there's an executables array field on the gemspec, e.g.
    s.executables = %w(hola adios)
-you **should** change the gem's version when pushing up a new realese.
-testing your gem is *extremely* important, not only does it help assure
you taht your ocde works, but it helps others know that your gem does
its job. Rubysts tend to view a solid test suite as one of the main
reasons for trusting a gem.
-some tools to speed up testing: minitest, rspec
-to add some tests to your gem create a `Rakefile` and a `test` directory
-to test hola do any of these:
    rake test
    rake
-by default msot gems use `rdoc` to generate docs. for a tutorial of how
to markup your code with rdoc:
    <http://docs.seattlerb.org/rdoc/RDoc/Markup.html>
other good gems for documenting are yard. when you push a gem,
rubydoc.info generates yardocs automtically from your gem
-nice blog from a rubyst:
    <http://rubylearning.com/blog/2010/10/06/gem-sawyer-modern-day-ruby-warrior/>

nice thing about ruby is its hackish Vim-Bash-like syntax. and its
community is much more hackish and less scientific than python. also
ruby gems remind me of vim scripts

Using Rdoc https://www.mikeperham.com/2010/12/16/using-rdoc/
One longstanding weakness with the Ruby community is subpar
documentation. I think many Rubyists tend to look down on actual API
documentation, preferring instead to just read source code directly.
I've been guilty of this too and I think some of this is due simply to
unfamiliarity with *RDoc*.

how to create man pages for my ruby gem?
    You would write a manpage for a Ruby executable the same way that
    you would write a manpage for any other program:
        -write it in some markup language and translate to roff. popular
        translators are (e.g ronn, pandoc)
    OR
        -just write it directly in ROFF.
    the former is preferred b/c roff syntax is a pain in the arse. also
    ronn is used/recommended in gem-man and ronn is written in ruby
    There is no way to install manpages from RubyGems (what would
    it do with that on Windows, for example?) but if you want to ship a
    manpage simply add a ./man directory in your gem root directory.
    e.g. the gem 'gem-man' contains:

What is Ruby's double-colon `::`? [so]
"::" is basically a namespace resolution operator. It allows you to access
items in modules, or class-level items in classes. For example, say you
had this setup:
    module SomeModule
        module InnerModule
            class MyClass
                CONSTANT = 4
            end
        end
    end
You could access CONSTANT from outside the module as
    SomeModule::InnerModule::MyClass::CONSTANT.
So `class Parsers::AdfParser` is in practice equivalent to:
    module Parsers
      class AdfParser
For this to work properly, and the file to be autoloaded its location
should be parsers/adf_parser.rb,

add this to ~/.irbrc
https://til.hashrocket.com/posts/09139e5206-enable-commands-history-on-rails-console-and-irb
    IRB.conf[:SAVE_HISTORY]=200
    IRB.conf[:HISTORY_FILE]='~/.irb_history'



