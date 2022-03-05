require_relative 'library'

class EnglishConverter
    def initialize
      @_message = nil
      @dictionary = Library.dictionary.invert
      # require 'pry'; binding.pry
    end

    def translate(input)
      letters = []
      # require 'pry'; binding.pry
      if input.all? {|input| input.class == String}
        letters << @dictionary[input].to_s
      else
        input.each{|letter| letters << @dictionary[letter].to_s}
      end
      letters.join
    end
    #
  #   if input.count > 1
  # else
  #   letters = input[0].split('')
  #   braille = letters.map {|letter| @hash[letter.to_sym]}
  # end
    #
    # def cut_every_40_chars(input)
    #   if input.length > 40
    #     @eng_message = input.chars.each_slice(40).map(&:join)
    #   else
    #     @eng_message = [input]
    #   end
    # end
    #
    #
    # def convert(eng_message)
    #   cut_every_40_chars(eng_message.gsub("\n", ''))
    #   translated_braille = translate(@eng_message)
    #   if @eng_message.count == 1
    #     output = output_braille_one_line(translated_braille)
    #   else
    #     output = output_braille_lines(translated_braille)
    #   end
    #   output
    # end
    #
    # def output_braille_one_line(line)
    #   lines = Array.new
    #   lines[0] = line.flat_map{|letter|  letter[0]}.join
    #   lines[1] = line.flat_map{|letter|  letter[1]}.join
    #   lines[2] = line.flat_map{|letter|  letter[2]}.join
    #   lines
    # end
    #
    # def output_braille_lines(lines)
    #   multi_lines = Array.new
    #   i = 0
    #   lines.each {|line|
    #     i
    #     multi_lines[i] = [line.flat_map{|letter|  letter[0]}.join,
    #                              line.flat_map{|letter|  letter[1]}.join,
    #                              line.flat_map{|letter|  letter[2]}.join]
    #     i += 1
    #   }
    #   # require 'pry'; binding.pry
    #   multi_lines
    # end
end
