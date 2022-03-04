require_relative 'spec_helper'
require_relative '../lib/braille_converter'

RSpec.describe 'night_writer' do

    context 'iteration 1-2' do
          before(:each) do
          @braille_converter = BrailleConverter.new
          end
        describe BrailleConverter do
          it 'exists' do
            expect(@braille_converter).to be_a(BrailleConverter)
          end

          it 'can covert an English letter/word to braille by lines' do
            expect(@braille_converter.convert('a')).to eq ["0.", "..", ".."]
            expect(@braille_converter.convert('hello')).to eq  ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]
          end

          it 'cuts input every 40 characters' do
            string = "a"*50
            cut_lines = @braille_converter.cut_every_40_chars(string)
            expect(cut_lines.count).to eq 2
            expect(cut_lines[0].length).to eq 40
            expect(cut_lines[1].length).to eq 10


          end
        end
    end






end
