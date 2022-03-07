module Formatable

  def cut_every_40_chars(input)
    if input.length > 40
      reformated_eng = input.chars.each_slice(40).map(&:join)
    else
      reformated_eng = [input]
    end
    reformated_eng
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
      multi_lines[i] = [line.flat_map{|letter|  letter[0]}.join+"\n",
                        line.flat_map{|letter|  letter[1]}.join+"\n",
                        line.flat_map{|letter|  letter[2]}.join+"\n"]
      i += 1
    }
    multi_lines
  end

  def combine_braille_lines(input_lines)
    combined_braille = %w[# # #]
    if input_lines.count > 3
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
      i = 0
      3.times do
      combined_braille[i] = input_lines[i].chars.each_slice(2).map(&:join)
      i += 1
              end
      combined_braille.map{|line| line.join}
    end
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
