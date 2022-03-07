require_relative 'library'
require_relative 'formatable'

class EnglishConverter
  include Formatable
    def initialize
      @dictionary = Library.dictionary.invert
    end

    def capitalization(input)
      cap_index_minus_1 = (0..input.length).find_all{|i| input[i] == '^'}
      if cap_index_minus_1 != []
        cap_index_minus_1.each do |index|
          input[index+1] = input[index+1].upcase
        end
        input.delete('^')
      else
        input
      end
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
      capitalized = capitalization(translated_english)
    end


    end
