class BrailleConverter
attr_reader :hash
    def initialize
      @eng_message = nil
      @hash = { " ": ["..", "..", ".."],
                  "!": ["..", "00", "0."],
                  "'": ["..", "0.", ".."],
                  ",": ["..", "..", "00"],
                  "-": ["..", "..", "00"],
                  ".": ["..", "00", ".0"],
                  "?": ["..", "0.", "00"],
                  a:   ["0.", "..", ".."],
                  b:   ["0.", "0.", ".."],
                  c:   ["0.", "0.", ".."],
                  d:   ["00", ".0", ".."],
                  e:   ["0.", ".0", ".."],
                  f:   ["00", "0.", ".."],
                  g:   ["00", "00", ".."],
                  h:   ["0.", "00", ".."],
                  i:   [".0", "0.", ".."],
                  j:   [".0", "00", ".."],
                  k:   ["0.", "..", "0."],
                  l:   ["0.", "0.", "0."],
                  m:   ["00", "..", "0."],
                  n:   ["00", ".0", "0."],
                  o:   ["0.", ".0", "0."],
                  p:   ["00", "0.", "0."],
                  q:   ["00", "00", "0."],
                  r:   ["0.", "00", "0."],
                  s:   [".0", "0.", "0."],
                  t:   [".0", "00", "0."],
                  u:   ["0.", "..", "00"],
                  v:   ["0.", "0.", "00"],
                  w:   [".0", "00", ".0"],
                  x:   ["00", "..", "00"],
                  y:   ["00", ".0", "00"],
                  z:   ["0.", ".0", "00"]
                }
    end

    def translate(input)
      if input.count > 1
        lines = input.map{|line| line.split('')}
        braille = lines.map {|line| line.map {|letter| @hash[letter.to_sym]}}
      else
        letters = input[0].split('')
        braille = letters.map {|letter| @hash[letter.to_sym]}
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
