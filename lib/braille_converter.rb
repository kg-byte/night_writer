require_relative 'library'
require_relative 'formatable'

class BrailleConverter
    include Formatable

    def initialize
      @dictionary = Library.dictionary
      @num_key = Library.num_key
    end

    def de_digitalize(input)
      output = input.each_char.map{|letter|
      if '0123456789'.include?(letter)
        # require 'pry'; binding.pry
        letter = '=' + @num_key[letter.to_i]
      else
        letter = letter
      end }
      output.join
    end

    def de_capitalization(input)
      special_letters = ["^", "=", " ", "!", "'", ",", "-", ".", "?"]
        output = input.each_char.map{|letter|
          if letter == letter.upcase && !special_letters.include?(letter)
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
      digit_transformed = de_digitalize(eng_message.gsub("\n", ''))
      cap_transformed = de_capitalization(digit_transformed)
      reformated_eng = cut_every_40_chars(cap_transformed)
      translated_braille = translate(reformated_eng)
      if reformated_eng.count == 1
        output = output_braille_one_line(translated_braille)
      else
        output = output_braille_lines(translated_braille)
      end
      output.join
    end

end
