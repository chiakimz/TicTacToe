require 'game'

describe Game do
  game = Game.new
  it 'has an array of 1 to 9 as a board' do
    expect(game.board).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  describe 'tic(n)' do
    it 'replaces numbers with X and O alternately' do
      expect(game.tic(4)).to eq [1, 2, 3, 'X', 5, 6, 7, 8, 9]
    end

    it 'raises an error if the place is already taken' do
      message = 'This place is taken! Choose somewhere else!'
      game.tic(3)
      expect{ game.tic(3) }.to raise_error message
    end
  end
end
