require_relative 'braille_converter'

eng_reader = File.open(ARGV[0], "r")
eng_message = eng_reader.read
eng_reader.close

place_holder = eng_message.upcase
braille_writer = File.open(ARGV[1], "w")
braille_writer.write(place_holder)
puts "Created 'braille.txt' containing #{eng_message.length} characters"
