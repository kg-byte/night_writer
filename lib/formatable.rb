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
    lines.map{|line| line + "\n"}
  end

  def output_braille_lines(lines)
    multi_lines = Array.new
    i = 0
    lines.each {|line|
      multi_lines[i] = [line.flat_map{|letter|  letter[0]}.join+"\n",
                        line.flat_map{|letter|  letter[1]}.join+"\n",
                        line.flat_map{|letter|  letter[2]}.join+"\n"]
      i += 1
    }
    multi_lines
  end


  def combine_braille_lines_single(input_lines)
    combined_braille = %w[# # #]
    i = 0
    3.times do
      combined_braille[i] = input_lines[i].chars.each_slice(2).map(&:join)
      i += 1
    end
    combined_braille.map{|line| line.join}
  end


  def combine_braile_lines_multi(input_lines)
    iteration = input_lines.count / 3
    combined_braille = %w[# # #]
    i = 0
    iteration.times do
      combined_braille[0] += input_lines[i]
      combined_braille[1] += input_lines[i+1]
      combined_braille[2] += input_lines[i+2]
      i += 3
    end
    combined_braille.map{|row| row.delete("#")}
  end


  def combine_braille_lines(input_lines)
    input_lines = input_lines
    if input_lines.count > 3
      combine_braile_lines_multi(input_lines)
    else
      combine_braille_lines_single(input_lines)
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
