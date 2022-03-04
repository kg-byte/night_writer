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

    def translate
      letters = @eng_message.split('')
      letters.delete("\n")
      letters.map {|letter| @hash[letter.to_sym]}
    end

    def convert(eng_message)
      @eng_message = eng_message
      lines = Array.new
      braille_message = translate
      lines[0] = braille_message.flat_map{|letter|  letter[0]}.join
      lines[1] = braille_message.flat_map{|letter|  letter[1]}.join
      lines[2] = braille_message.flat_map{|letter|  letter[2]}.join
      lines
    end



end
