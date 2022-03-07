require_relative 'library'
require_relative 'formatable'
class BrailleConverter
attr_reader :dictionary
    include Formatable
    def initialize
      @dictionary = Library.dictionary
    end

    def capitalization(input)
        output = input.each_char.map{|letter|
          if letter == letter.upcase
            letter = "^" + letter.downcase
          else
            letter = letter
          end
        }
       output.join
    end

    def translate(input)
      if input.count > 1
        lines = input.map{|line| line.split('')}
        braille = lines.map {|line| line.map {|letter| @dictionary[letter.to_sym]}}
      else
        letters = input[0].split('')
        braille = letters.map {|letter| @dictionary[letter.to_sym]}
      end
      braille
    end



    def convert(eng_message)
      cap_transformed = capitalization(eng_message.gsub("\n", ''))
      reformated_eng = cut_every_40_chars(cap_transformed)
      translated_braille = translate(reformated_eng)
      if reformated_eng.count == 1
        lines = output_braille_one_line(translated_braille)
        output = lines.map{|line| line + "\n"}
      else
        output = output_braille_lines(translated_braille)
      end
      output.join
      # require 'pry'; binding.pry
    end

end
