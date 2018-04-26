class Game
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn = 0
  end

  def tic(n)
    if @turn % 2 == 0
      @board[n - 1] = 'X'
    else
      @board[n - 1] = 'O'
    end
    @turn += 1
    @board
  end
end
