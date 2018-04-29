require 'game'

describe Game do
  game = Game.new
  it 'has an array of 1 to 9 as a board' do
    expect(game.board).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  describe 'tic(n)' do
    it 'replaces numbers with X and O alternately' do
      expect { game.tic(1) }.to output("\" X  2  3 \"\n\" 4  5  6 \"\n\" 7  8  9 \"\n").to_stdout
    end

    it 'raises an error if the place is already taken' do
      message = 'This place is taken! Choose somewhere else!'
      game.tic(3)
      expect{ game.tic(3) }.to raise_error message
    end

    it 'ends the game when one player wins vertically' do
      game.tic(4)
      game.tic(2)
      expect(game.tic(7)).to eq 'Cross won!'
    end

    it 'ends the game when one player wins horizontally' do
      game = Game.new
      for n in [1, 4, 2, 5]
        game.tic(n)
      end
      expect(game.tic(3)).to eq 'Cross won!'
    end

    it 'ends the game when one player wins Diagon Alley' do
      game = Game.new
      for n in [1, 4, 5, 2,]
        game.tic(n)
      end
      expect(game.tic(9)).to eq 'Cross won!'
    end

    it 'has no winner' do
      game = Game.new
      for n in [2, 1, 5, 3, 6, 4, 7, 8]
        game.tic(n)
      end
      expect(game.tic(9)).to eq 'You losers'
    end
  end
end
