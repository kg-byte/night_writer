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
      if input_lines.count > 3
        combined_braille = %w[# # #]
      iteration = input_lines.count / 3
        i = 0
        iteration.times do
        combined_braille[0] += input_lines[i]
        combined_braille[1] += input_lines[i+1]
        combined_braille[2] += input_lines[i+2]
        i += 3
                          end
        combined_braille.map{|row| row.delete("#")}
      else
        line_length = input_lines[0].length / 3
        combined_braille = input_lines[0].chars.each_slice(line_length).map(&:join)
      end
    end

    def convert(braille_message)
      braille_message = braille_message.split("\n")
      combined_braille = combine_braille_lines(braille_message)
      regrouped_braille = regroup(combined_braille)
      translated_english = translate(regrouped_braille)
      # require 'pry'; binding.pry
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
