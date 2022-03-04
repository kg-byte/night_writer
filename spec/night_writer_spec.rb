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
        end
    end






end
