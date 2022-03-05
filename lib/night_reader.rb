require_relative 'english_converter'

braille_reader = File.open(ARGV[0], "r")
braille_message = braille_reader.read
braille_reader.close
# require 'pry'; binding.pry
english_converter = EnglishConverter.new
# english_message = english_converter.convert(braille_message)
english_writer = File.open(ARGV[1], "w")
# if english_message.all? {|element| element.class == String}
#   english_message.each {|row|
#   english_writer.write(row)
#   english_writer.write("\n")
#             }
# else
#   english_message.each{|line|
#     line.each {|row|
#     english_writer.write(row)
#     english_writer.write("\n")
#               }
#                       }
# end
  english_writer.close
puts "Created 'original_message.txt' containing #{eng_message.length-1} characters"
