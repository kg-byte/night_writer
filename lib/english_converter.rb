require_relative 'library'

class EnglishConverter
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

    def combine_braille_lines(input_lines)
      if input_lines.length > 3
        combined_braille = []
        i = 0
        until i == input_lines.length - 3 do
        combined_braille << input_lines[i]+input_lines[i+3]
        i += 1
        end
      else
        line_length = input_lines[0].length / 3
        combined_braille = input_lines[0].chars.each_slice(line_length).map(&:join)
      end
      combined_braille
    end

    def convert(braille_message)
      braille_message = braille_message.split("\n")
      combined_braille = combine_braille_lines(braille_message)
      regrouped_braille = regroup(combined_braille)
      translated_english = translate(regrouped_braille)
    end

    def regroup(input)
      i = 0
      regrouped_braille = []
      divided_lines = input.map {|line| line.chars.each_slice(2).map(&:join)}
      until i == divided_lines[0].length do
        regrouped_braille << divided_lines.map{|line| line[i]}
        i+=1
      end
      regrouped_braille
      end

    end
