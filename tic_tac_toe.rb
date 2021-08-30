# Build a tic-tac-toe game on the command line where two human players can play against each other
# and the board is displayed in between turns.

# Simple game loop for two players.
class Game
  def play_game(current_board)
    player_symbol = 'X'
    until current_board.confirm_win
      player_symbol = if player_symbol == 'X'
                        'O'
                      else
                        'X'
                      end
      puts "Player #{player_symbol} enter position:"
      current_board.make_move(gets.chomp, player_symbol)
      break if current_board.complete?
    end
    if current_board.complete?
      puts "You're both losers."
    else
      puts "Player #{player_symbol} wins!"
    end
  end
end

# Simple console display board with simple numpad position selection and input enforcement.
class Board
  def initialize
    @board11 = '7'
    @board12 = '8'
    @board13 = '9'
    @board21 = '4'
    @board22 = '5'
    @board23 = '6'
    @board31 = '1'
    @board32 = '2'
    @board33 = '3'
    @valid_moves = %w[1 2 3 4 5 6 7 8 9]
  end

  def show_board
    print "\n #{@board11}|#{@board12} |#{@board13}\n__ __ __
        \n #{@board21}|#{@board22} |#{@board23}\n__ __ __
        \n #{@board31}|#{@board32} |#{@board33}\n\n\n"
  end

  def invalid?(attempted_position)
    !@valid_moves.include?(attempted_position)
  end

  def complete?
    @valid_moves.empty?
  end

  def make_move(position, player)
    if invalid?(position)
      puts 'Invalid position. Enter invalid position:'
      make_move(gets.chomp, player)
    else
      @valid_moves.delete(position)
      @board11 = player if position == '7'
      @board12 = player if position == '8'
      @board13 = player if position == '9'
      @board21 = player if position == '4'
      @board22 = player if position == '5'
      @board23 = player if position == '6'
      @board31 = player if position == '1'
      @board32 = player if position == '2'
      @board33 = player if position == '3'
      show_board
    end
  end

  def confirm_win
    if (@board11 == @board12) && (@board12 == @board13)
      true
    elsif (@board21 == @board22) && (@board22 == @board23)
      true
    elsif (@board31 == @board32) && (@board32 == @board33)
      true
    elsif (@board11 == @board21) && (@board21 == @board31)
      true
    elsif (@board12 == @board22) && (@board22 == @board32)
      true
    elsif (@board13 == @board23) && (@board23 == @board33)
      true
    elsif (@board11 == @board22) && (@board22 == @board33)
      true
    elsif (@board13 == @board22) && (@board22 == @board31)
      true
    else
      false
    end
  end
end

board = Board.new
board.show_board
game = Game.new
game.play_game(board)
