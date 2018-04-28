class Game
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn = 0
  end

  def tic(n)
    fail 'This place is taken! Choose somewhere else!' if @board[n - 1].instance_of?(String)
    if @turn % 2 == 0
      @board[n - 1] = 'X'
    else
      @board[n - 1] = 'O'
    end
    if winner == 'X'
      return 'Cross won!'
    elsif winner == 'O'
      return 'Naught won!'
    end
    @turn += 1
    if @turn == 9
      return 'You losers'
    else
      return @board
    end
  end

  def winner
    #checking horizontal
    if @board[0] == @board[1] && @board[0] == @board[2]
      return @board[0]
    elsif @board[3] == @board[4] && @board[3] == @board[5]
      return @board[3]
    elsif @board[6] == @board[7] && @board[6] == @board[8]
      return @board[6]
    #checking vertical
    elsif @board[0] == @board[3] && @board[0] == @board[6]
      return @board[0]
    elsif @board[1] == @board[4] && @board[1] == @board[7]
      return @board[1]
    elsif @board[2] == @board[5] && @board[2] == @board[8]
      return @board[2]
    #checking diagon alley
    elsif @board[0] == @board[4] && @board[0] == @board[8]
      return @board[0]
    elsif @board[2] == @board[4] && @board[2] == @board[6]
      return @board[2]
    else
      nil
    end
  end
end
