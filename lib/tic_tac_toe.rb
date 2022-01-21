class TicTacToe
attr_accessor :board

    def initialize
        @board = Array.new(9, " ") 
    end
    
     WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [2, 5, 8], [0, 4, 8], [2, 4, 6], [1, 4, 7]]

     def display_board
        board = @board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end
    
     def input_to_index(input)
     index = input.strip.to_i - 1
     index
     end

    def move(index, token = "X")
        @board[index] = token
    end

     def position_taken?(index)
    @board[index] == " " ? false : true
    end
    
    def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
        puts "Please enter a number between 1-9."
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
        token = current_player
    move(index, token)
    else
        puts "Invalid Move."
        turn
    end
    display_board
    end
    
    def play
    turn until over?
    if draw? 
    puts "Cat's Game!"
    else
    puts "Congratulations #{winner}!"
    end
end
    
    def won?
        WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[1]] != " "
        return combo
      end
    end
    false
    end
    
    def full?
    !@board.include?(" ") 
    end
    
    def over?
        draw? || won? 
    end
    
    
    
     def draw?
     full? && !won? 
    end
    
    
    
    def winner
     if combo = won? 
    return "#{board[combo[1]]}"
    end
end
    
end