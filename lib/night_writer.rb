require_relative 'braille_converter'

eng_reader = File.open(ARGV[0], "r")
eng_message = eng_reader.read
eng_reader.close

braille_converter = BrailleConverter.new
braille_message = braille_converter.convert(eng_message)
braille_writer = File.open(ARGV[1], "w")
braille_writer.write(braille_message)
braille_writer.close

puts "Created 'braille.txt' containing #{eng_message.length-1} characters"
