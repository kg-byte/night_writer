require_relative 'english_converter'

braille_reader = File.open(ARGV[0], "r")
braille_message = braille_reader.read
braille_reader.close

english_converter = EnglishConverter.new
english_message = english_converter.convert(braille_message)
english_writer = File.open(ARGV[1], "w")
english_writer.write(english_message)
english_writer.close

puts "Created 'original_message.txt' containing #{english_message.length} characters"
