def main()
	# initialize variables
	board = [0,0,0,0,0,0,0,0,0]
	player_one_turn = true
	game_over = false

	#Welcomes players
	puts ""
	puts "Welcome to Tic Tac Toe."
	puts ""
	puts "This is a 2 player version of Tic Tac Toe on a 3x3 grid. Each square of the grid has an assigned number. The grid is numbered left to right and top to bottom starting at 0 (e.g. 0 is the top-left square, 2 is the top-right square, 4 is the middle square, and 8 is the bottom-right square)."
	puts "" 
	puts "Each player will be prompted to enter a number between 0 and 8 to place their X or O in the corresponding square of the game. The first player to have 3 of their letters make a straight line (vertically, horizontally, or diagonally) wins." 
	puts ""
	puts "It's player one's turn..."

	# main game loop
	while true
		while true
			puts "Where would you to go? Enter number from 0 to 8."
			move = gets.strip.to_i
			if (move > 8) || (move <0) || ( ! (board[move] == 0))
				puts "Error. Move not valid. Try again."
			else
				board[move] = player_one_turn ? "X" : "O"
				break
			end
		end
		print_board board

		#check if the game is over		
		break if (game_over = game_over?(board)) == true

		player_one_turn = !player_one_turn
		puts "Player #{player_one_turn ? "one's" : "two's"} turn..."
	end
end


def print_board (board)
	#initializes board layout
	board_layout = [[" "," "," ","|"," "," "," ","|"," "," "," "],
				["_","_","_","+","_","_","_","+","_","_"," "],
				[" "," "," ","|"," "," "," ","|"," "," "," "],
				["_","_","_","+","_","_","_","+","_","_"," "],
				[" "," "," ","|"," "," "," ","|"," "," "," "]]

	#updates board layout with entries players have put in
	board.each_with_index do |element,index|
		if element != 0
			column = (index % 3) * 4 + 1
			if index < 3
				row = 0
			elsif index < 6
				row = 2
			else 
				row = 4
			end
			board_layout[row][column] = element
		end
	end
	
	#prints board layout on the screen
	board_layout.each do |row_array|
		row_array.each do |character|
			print character
		end
		puts ""
	end
end

def game_over?(board)

	# checks for tie game by see if every number on the board is filled
	count = 0
	board.each do |number|
		count += 1 if number == 0
	end

	if count == 0
		puts "Tie game. Thanks for playing!"
		return true
	end

	#checks to see if anyone has won
	if (board[0] == "X" && board[3] == "X" && board[6] == "X") || (board[1] == "X" && board[4] == "X" && board[7] == "X") || (board[2] == "X" && board[5] == "X" && board[8] == "X") || (board[0] == "X" && board[1] == "X" && board[2] == "X") || (board[3] == "X" && board[4] == "X" && board[5] == "X") || (board[6] == "X" && board[7] == "X" && board[8] == "X") || (board[0] == "X" && board[4] == "X" && board[8] == "X") || (board[2] == "X" && board[4] == "X" && board[6] == "X") 
		puts "Player one has won. Thanks for playing!"
		return true
	elsif (board[0] == "O" && board[3] == "O" && board[6] == "O") || (board[1] == "O" && board[4] == "O" && board[7] == "O") || (board[2] == "O" && board[5] == "O" && board[8] == "O") || (board[0] == "O" && board[1] == "O" && board[2] == "O") || (board[3] == "O" && board[4] == "O" && board[5] == "O") || (board[6] == "O" && board[7] == "O" && board[8] == "O") || (board[0] == "O" && board[4] == "O" && board[8] == "O") || (board[2] == "O" && board[4] == "O" && board[6] == "O") 
		puts "Player two has won. Thanks for playing!"
		return true 
	end
	return false
end 

main()



















