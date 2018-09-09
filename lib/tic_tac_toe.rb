def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(str)
  number = str.to_i
  number = number - 1
  return number
end

# def move(board,index,value = "X")
#   board[index] = value
# end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6], #first columns
  [1,4,7], #2nd columns
  [2,5,8], #3rd columns
  [0,4,8], #first diagonals
  [2,4,6] #diagonal 2nd
]
def won?(board)
  WIN_COMBINATIONS.find do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    (board[win_index_1] == "X" && board[win_index_1] == board[win_index_2] && board[win_index_1] == board[win_index_3]) || (board[win_index_1] == "O" && board[win_index_1] == board[win_index_2] && board[win_index_1] == board[win_index_3])
  end

end

def full?(board)
  full = board.all? {|num| num == "X" || num == "O"}
  return full
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  win_indices = won?(board)
  if !win_indices
    return nil
  end
  index = win_indices[0]
  if board[index] == "X"
    return "X"
  elsif board[index] == "O"
    return "O"
  end
end
