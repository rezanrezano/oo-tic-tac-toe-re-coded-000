class TicTacToe
  #def initialize(board = nil)
  #  @board = board || Array.new(9, " ")
#  end
  def initialize(board=[" "," "," "," "," "," "," "," "," "])
    @board=board
  end
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                       [0,4,8],[2,4,6]]
                       #def board
                      # @board
                     #end
                       def display_board
                         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
                         puts "-----------"
                         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
                         puts "-----------"
                         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
                       end
                       def move(location, current_player)
                        @board[location.to_i-1] = current_player
                       end
                       def position_taken?(index)
                         if @board[index] == " "||@board[index] ==""||@board[index] ==nil
                           return false
                         elsif @board[index] =="X"||@board[index] =="O"
                           return true
                       end
                       end
                       def valid_move?(position)
                         index=position.to_i-1;
                         if position.to_i.between?(1,9)&&!position_taken?(index)
                           true
                         else
                           false
                         end
                       end
                       def turn
                         puts "Please enter 1-9:"
                       input=gets.strip
                       if valid_move?(input)
                         move(input,current_player)
                         display_board
                       else
                         turn
                       end
                       end
                       def turn_count
                         count=0
                         @board.each do |item|
                           if item =="X"||item=="O"
                           count+=1
                         end
                       end
                       return count
                       end
                       def current_player
                         if turn_count.even?
                           return "X"
                         else
                           return "O"
                         end
                       end
                       def won?
                         WIN_COMBINATIONS.detect do |rezano|
                           @board[rezano[0]]==@board[rezano[1]] &&
                          @board[rezano[1]]==@board[rezano[2]] &&
                           position_taken?(rezano[0])
                       end
                       end
                       def full?
                         @board.all?do|rezano|
                         rezano=="X"||rezano=="O"
                         end
                       end
                       def draw?
                         !won?&&full?
                       end
                       def over?

                       draw?||won?
                       end
                       def winner
                         rezano=won?
                         if rezano
                           return @board[rezano[0]]
                         end
                       end
                       def play

                         while !over?
                           turn
end
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cats Game!"
end
                         end

end
