require_relative 'library'
class BrailleConverter
attr_reader :dictionary
    def initialize
      @eng_message = nil
      @dictionary = Library.dictionary
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


    def cut_every_40_chars(input)
      if input.length > 40
        @eng_message = input.chars.each_slice(40).map(&:join)
      else
        @eng_message = [input]
      end
    end


    def convert(eng_message)
      cut_every_40_chars(eng_message.gsub("\n", ''))
      translated_braille = translate(@eng_message)
      if @eng_message.count == 1
        output = output_braille_one_line(translated_braille)
      else
        output = output_braille_lines(translated_braille)
      end
      output
    end

    def output_braille_one_line(line)
      lines = Array.new
      lines[0] = line.flat_map{|letter|  letter[0]}.join
      lines[1] = line.flat_map{|letter|  letter[1]}.join
      lines[2] = line.flat_map{|letter|  letter[2]}.join
      lines
    end

    def output_braille_lines(lines)
      multi_lines = Array.new
      i = 0
      lines.each {|line|
        i
        multi_lines[i] = [line.flat_map{|letter|  letter[0]}.join,
                                 line.flat_map{|letter|  letter[1]}.join,
                                 line.flat_map{|letter|  letter[2]}.join]
        i += 1
      }
      # require 'pry'; binding.pry
      multi_lines
    end
end
