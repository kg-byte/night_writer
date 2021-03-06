require_relative 'spec_helper'
require_relative '../lib/braille_converter'
require_relative '../lib/english_converter'

RSpec.describe 'night_writer' do

    context 'iteration 1-2' do
          before(:each) do
          @braille_converter = BrailleConverter.new
          end
        describe BrailleConverter do
          it 'exists' do
            expect(@braille_converter).to be_a(BrailleConverter)
          end

          it 'can translate an English letter/word to individual braille' do
            expect(@braille_converter.translate(["a"])).to eq [["0.", "..", ".."]]
            expect(@braille_converter.translate(["hello"])).to eq  [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
          end

          it 'cuts input every 40 characters' do
            string = "a"*50
            cut_lines = @braille_converter.cut_every_40_chars(string)
            expect(cut_lines.count).to eq 2
            expect(cut_lines[0].length).to eq 40
            expect(cut_lines[1].length).to eq 10
          end

          it 'outputs three lines of braille when input length <= 40' do
            lines = @braille_converter.output_braille_one_line(["a"*40])
            expect(lines.count).to eq 3
          end

          it 'outputs six braille lines when input length is  between 41 and 80' do
            input_1 = @braille_converter.cut_every_40_chars("a"*41)
            translate_1 = @braille_converter.translate(input_1)
            lines_1 = @braille_converter.output_braille_lines(translate_1)
            expect(lines_1.flatten.count).to eq 6
            input_2 = @braille_converter.cut_every_40_chars("a"*79)
            translate_2 = @braille_converter.translate(input_1)
            lines_2 = @braille_converter.output_braille_lines(translate_2)
            expect(lines_2.flatten.count).to eq 6
          end

          it 'can convert a letter/word/sentence' do
            expect(@braille_converter.convert("a")).to eq  "0.\n..\n..\n"
            expect(@braille_converter.convert("hello")).to eq "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n"
            expect(@braille_converter.convert("a"*41).length).to eq 252
          end
        end
    end

    context 'iteration 3' do
        before(:each) do
          @english_converter = EnglishConverter.new
          @braille_converter = BrailleConverter.new
        end
      describe EnglishConverter do

        it 'exists' do
          expect(@english_converter).to be_a(EnglishConverter)
        end

        it 'can translate braille to an English letter/word' do
          expect(@english_converter.translate(["0.", "..", ".."])).to eq "a"
          hello = @english_converter.translate([["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]])
          expect(hello).to eq "hello"
        end

        it 'can combine braille if characgter length is over 40' do
          multi_braille_lines = @braille_converter.convert("a"*41).split("\n")
          combined_braille_lines = @english_converter.combine_braille_lines(multi_braille_lines)
          expect(combined_braille_lines.count).to eq 3
        end


        it 'can convert braille to english letters regardless of length' do
          forty_one_as = @braille_converter.convert("a"*41)
          expect(@english_converter.convert(forty_one_as)).to eq "a"*41
          hello = @braille_converter.convert("hello")
          expect(@english_converter.convert(hello)).to eq "hello"
        end
      end

    context 'iteration 4'
    before(:each) do
      @english_converter = EnglishConverter.new
      @braille_converter = BrailleConverter.new
    end
      describe BrailleConverter do

        it 'can add cap switch to cap letters' do
          expect(@braille_converter.de_capitalization("ABC")).to eq "^a^b^c"
        end

        it 'can translate numbers to braille' do
          expect(@braille_converter.de_digitalize('123')).to eq '=a=b=c'

        end

      end
      describe EnglishConverter do
        it 'can translate cap letters to english' do
          cap_abc = @braille_converter.convert("ABC")
          expect(@english_converter.convert(cap_abc)).to eq "ABC"

        end

        it 'can translate numbers to english' do
          word_with_num = @braille_converter.de_digitalize("2 is greater than 1")
          expect(@english_converter.digitalize(word_with_num)).to eq "2 is greater than 1"
        end


      end
    end
end
