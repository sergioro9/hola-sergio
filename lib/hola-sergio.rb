require "hola-sergio/version"

module HolaSergio
end

class Hola
  include HolaSergio
  def self.hi(language="english")
    translator=Translator.new(language)
    translator.hi
  end
end

require "hola-sergio/translator"
