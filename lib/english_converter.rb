require_relative 'library'
require_relative 'formatable'

class EnglishConverter
  include Formatable
    def initialize
      @dictionary = Library.dictionary.invert
    end



    def translate(input)
      letters = []
      if input.all? {|input| input.class == String}
        letters << @dictionary[input].to_s
      else
        input.each{|letter| letters << @dictionary[letter].to_s}
      end
      letters.join
    end


    def convert(braille_message)
      braille_message = braille_message.split("\n")
      combined_braille = combine_braille_lines(braille_message)
      regrouped_braille = regroup(combined_braille)
      translated_english = translate(regrouped_braille)
    end


    end
