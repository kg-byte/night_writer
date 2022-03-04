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
        end




    end









end
