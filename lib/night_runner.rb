require_relative 'english_converter'
require_relative 'braille_converter'

class NightRunner
  def initialize
    @input = ''
  end

  def read
    reader = File.open(ARGV[0], "r")
    @input = reader.read
    reader.close
  end

  def english_converter
    english_converter = EnglishConverter.new
    output = english_converter.convert(@input)
    puts "Created 'original_message.txt' containing #{output.length} characters"
    output
  end

  def braille_converter
    braille_converter = BrailleConverter.new
    puts "Created 'braille.txt' containing #{@input.length-1} characters"
    braille_converter.convert(@input)
  end

    def convert(type)
    read
    if type == "NightReader"
      output = english_converter
    elsif type == "NightWriter"
      output = braille_converter
    end
    write(output)
  end

  def write(message)
    writer = File.open(ARGV[1], "w")
    writer.write(message)
    writer.close
  end

end
