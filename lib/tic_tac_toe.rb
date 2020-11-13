


class TicTacToe

    attr_accessor :board

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    #Takes string input
    def input_to_index(input)
        input_int = input.to_i
        index = input_int - 1
        index
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O" ? true : false
    end

    def valid_move?(index)
        !position_taken?(index) && index < 9 && index >= 0 ? true : false
    end

    def turn_count
        9 - self.board.count(" ")
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter your move(1-9):"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            puts "Please enter your move(1-9):"
            input = gets.strip
        end
    

    end

    def won?
        win_comb = false
        WIN_COMBINATIONS.each do |comb|
            if (@board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X") || (@board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O")
                win_comb = comb
            end
        end
        win_comb
    end

    def full?
        !board.include?(" ") ? true : false
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        won? != false || draw? ? true : false
    end

    def winner
        if won?
            winner = @board[won?[0]]
        else
            nil
        end
    end



    def play
        until over? do
            turn
        end
        won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
    end

end