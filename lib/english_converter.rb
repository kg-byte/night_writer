require_relative 'library'

class EnglishConverter
    def initialize
      @braille_message = []
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

    def combine_braille_lines(input)
      if input.length > 3
        i = 0
        until i == input.length - 3 do
        @braille_message << input[i]+input[i+3]
        i += 1
        end
      else
        @braille_message = input
      end
      @braille_message
    end

    def convert(braille_message)
      combine_braille_lines(braille_message.split("\n"))
      translated_english = translate(@eng_message)
      require 'pry'; binding.pry
    end


end
