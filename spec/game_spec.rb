# Testing bin/game.rb
require './lib/game'

RSpec.describe Game do
  describe '#move' do
    it 'iterates through an array' do
      expect([1, 2, 3].my_each { |e| e }).to eql([1, 2, 3])
    end
  end
end
