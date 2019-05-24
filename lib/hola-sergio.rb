require "hola-sergio/version"
require "hola-sergio/translator"

module Hola
  class Hola
    def self.hi(language="english")
      translator=Translator.new(language)
      translator.hi
    end
  end
end
