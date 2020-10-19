class Game
  attr_accessor :board, :last_move_start
  def initialize
    puts "Welcome to your game of chess"
    print "Player 1 name: "
    @player1 = gets.chomp
    print "Player 2 name: "
    @player2 = gets.chomp
    if @player2 == @player1
      @player2 = @player2 + '1'
    end
    @current_player = @player1
    @@last_move_start = ''

    @@board = {
      'A1' => Rook.new('white', 'A1', 'unmoved'),
      'B1' => Knight.new('white', 'B1'),
      'C1' => Bishop.new('white', 'C1'),
      'D1' => Queen.new('white', 'D1'),
      'E1' => King.new('white', 'E1', 'unmoved'),
      'F1' => Bishop.new('white', 'F1'),
      'G1' => Knight.new('white', 'G1'),
      'H1' => Rook.new('white', 'H1', 'unmoved'),
      'A2' => Pawn.new('white', 'A2'),
      'B2' => Pawn.new('white', 'B2'),
      'C2' => Pawn.new('white', 'C2'),
      'D2' => Pawn.new('white', 'D2'),
      'E2' => Pawn.new('white', 'E2'),
      'F2' => Pawn.new('white', 'F2'),
      'G2' => Pawn.new('white', 'G2'),
      'H2' => Pawn.new('white', 'H2'),
      'A3' => Blank.new,
      'B3' => Blank.new,
      'C3' => Blank.new,
      'D3' => Blank.new,
      'E3' => Blank.new,
      'F3' => Blank.new,
      'G3' => Blank.new,
      'H3' => Blank.new,
      'A4' => Blank.new,
      'B4' => Blank.new,
      'C4' => Blank.new,
      'D4' => Blank.new,
      'E4' => Blank.new,
      'F4' => Blank.new,
      'G4' => Blank.new,
      'H4' => Blank.new,
      'A5' => Blank.new,
      'B5' => Blank.new,
      'C5' => Blank.new,
      'D5' => Blank.new,
      'E5' => Blank.new,
      'F5' => Blank.new,
      'G5' => Blank.new,
      'H5' => Blank.new,
      'A6' => Blank.new,
      'B6' => Blank.new,
      'C6' => Blank.new,
      'D6' => Blank.new,
      'E6' => Blank.new,
      'F6' => Blank.new,
      'G6' => Blank.new,
      'H6' => Blank.new,
      'A7' => Pawn.new('black', 'A7'),
      'B7' => Pawn.new('black', 'B7'),
      'C7' => Pawn.new('black', 'C7'),
      'D7' => Pawn.new('black', 'D7'),
      'E7' => Pawn.new('black', 'E7'),
      'F7' => Pawn.new('black', 'F7'),
      'G7' => Pawn.new('black', 'G7'),
      'H7' => Pawn.new('black', 'H7'),
      'A8' => Rook.new('black', 'A8', 'unmoved'),
      'B8' => Knight.new('black', 'B8'),
      'C8' => Bishop.new('black', 'C8'),
      'D8' => Queen.new('black', 'D8'),
      'E8' => King.new('black', 'E8', 'unmoved'),
      'F8' => Bishop.new('black', 'F8'),
      'G8' => Knight.new('black', 'G8'),
      'H8' => Rook.new('black', 'H8', 'unmoved')
    }
  end

  def print_board
    print '8 ', @@board['A8'].symbol, ' ', @@board['B8'].symbol, ' ', @@board['C8'].symbol, ' ', @@board['D8'].symbol, ' ', @@board['E8'].symbol, ' ', @@board['F8'].symbol, ' ', @@board['G8'].symbol, ' ', @@board['H8'].symbol, "\n"
    print '7 ', @@board['A7'].symbol, ' ', @@board['B7'].symbol, ' ', @@board['C7'].symbol, ' ', @@board['D7'].symbol, ' ', @@board['E7'].symbol, ' ', @@board['F7'].symbol, ' ', @@board['G7'].symbol, ' ', @@board['H7'].symbol, "\n"
    print '6 ', @@board['A6'].symbol, ' ', @@board['B6'].symbol, ' ', @@board['C6'].symbol, ' ', @@board['D6'].symbol, ' ', @@board['E6'].symbol, ' ', @@board['F6'].symbol, ' ', @@board['G6'].symbol, ' ', @@board['H6'].symbol, "\n"
    print '5 ', @@board['A5'].symbol, ' ', @@board['B5'].symbol, ' ', @@board['C5'].symbol, ' ', @@board['D5'].symbol, ' ', @@board['E5'].symbol, ' ', @@board['F5'].symbol, ' ', @@board['G5'].symbol, ' ', @@board['H5'].symbol, "\n"
    print '4 ', @@board['A4'].symbol, ' ', @@board['B4'].symbol, ' ', @@board['C4'].symbol, ' ', @@board['D4'].symbol, ' ', @@board['E4'].symbol, ' ', @@board['F4'].symbol, ' ', @@board['G4'].symbol, ' ', @@board['H4'].symbol, "\n"
    print '3 ', @@board['A3'].symbol, ' ', @@board['B3'].symbol, ' ', @@board['C3'].symbol, ' ', @@board['D3'].symbol, ' ', @@board['E3'].symbol, ' ', @@board['F3'].symbol, ' ', @@board['G3'].symbol, ' ', @@board['H3'].symbol, "\n"
    print '2 ', @@board['A2'].symbol, ' ', @@board['B2'].symbol, ' ', @@board['C2'].symbol, ' ', @@board['D2'].symbol, ' ', @@board['E2'].symbol, ' ', @@board['F2'].symbol, ' ', @@board['G2'].symbol, ' ', @@board['H2'].symbol, "\n"
    print '1 ', @@board['A1'].symbol, ' ', @@board['B1'].symbol, ' ', @@board['C1'].symbol, ' ', @@board['D1'].symbol, ' ', @@board['E1'].symbol, ' ', @@board['F1'].symbol, ' ', @@board['G1'].symbol, ' ', @@board['H1'].symbol, "\n"
    print '  A B C D E F G H', "\n"
  end

  def valid_positions_right(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until right_column == 'I' || piece_found
      new_position = (right_column + position_number)
      unless board[new_position].is_a?(Blank)
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      else
        positions.push(new_position)
      end
      right_column = (right_column.ord + 1).chr
    end
    positions
  end

  def valid_positions_left(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until left_column == '@' || piece_found
      new_position = (left_column + position_number)
      unless board[new_position].is_a?(Blank)
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      else
        positions.push(new_position)
      end
      left_column = (left_column.ord - 1).chr
    end
    positions
  end

  def valid_positions_up(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    piece_found = false
    until row_up == '9' || piece_found
      new_position = (position_letter + row_up)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_up = (row_up.to_i + 1).to_s
    end
    positions
  end

  def valid_positions_down(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    piece_found = false
    until row_down == '0' || piece_found
      new_position = (position_letter + row_down)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
    end
    positions
  end

  def valid_positions_up_right(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until row_up == '9' || right_column == 'I' || piece_found
      new_position = (right_column + row_up)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_up = (row_up.to_i + 1).to_s
      right_column = (right_column.ord + 1).chr
    end
    positions
  end

  def valid_positions_down_right(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until row_down == '0' || right_column == 'I' || piece_found
      new_position = (right_column + row_down)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
      right_column = (right_column.ord + 1).chr
    end
    positions
  end

  def valid_positions_down_left(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until row_down == '0' || left_column == '@' || piece_found
      new_position = (left_column + row_down)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
      left_column = (left_column.ord - 1).chr
    end
    positions
  end

  def valid_positions_up_left(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until row_up == '9' || left_column == '@' || piece_found
      new_position = (left_column + row_up)
      if board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_up = (row_up.to_i + 1).to_s
      left_column = (left_column.ord - 1).chr
    end
    positions
  end

  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def king_check(position, colour, board)
    in_check = false
    all_valid_positions = []
    board.each do |key, value|
      if colour == 'black'
        if !value.is_a?(Blank) && ['♙', '♘', '♗', '♖', '♕', '♔'].include?(value.symbol)
          all_valid_positions.push(value.valid_positions(key, board))
        end
      else
        if !value.is_a?(Blank) && ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(value.symbol)
          all_valid_positions.push(value.valid_positions(key, board))
        end
      end
    end
    all_valid_positions.flatten!
    all_valid_positions.uniq!

    if all_valid_positions.include?(position)
      in_check = true
    end
    in_check
  end

  def checkmate(position, colour)
    if king_check(position, colour, @@board)
      array = @@board[position].valid_positions(position, @@board)

      board_dupe = @@board.dup
      board_dupe[position] = Blank.new
      array.all? do |x|
        board_dupe[x] = King.new(colour, x)
        checker = king_check(x, colour, board_dupe)
        board_dupe = @@board.dup
        board_dupe[position] = Blank.new
        checker
      end
    else
      false
    end
  end

  def make_move
    valid = false
    piece = ''
    if @current_player == @player1
      colour = 'white'
    else
      colour = 'black'
    end
    until valid
      puts "#{@current_player} select a piece to move"
      location = gets.chomp.upcase
      if @@board.key?(location)
        if @@board[location].is_a?(Blank)
          puts "There is no piece in this position", ""
        elsif @@board[location].colour == colour
          piece = location
          valid = true
        else
          puts "This is not your piece", ""
        end
      else
        puts "This is not a valid input", ""
      end
    end
    
    new_location = where_to_move(piece, colour)
    puts new_location
    if new_location.is_a?(Blank) || new_location.nil?
    elsif @@board[location].is_a?(Pawn)
      if @@board[new_location].is_a?(Blank) && new_location[1] == '6' && location[0] != new_location[0]
        @@board[new_location] = Pawn.new(colour, new_location)
        @@board[new_location[0] + (new_location[1].to_i - 1).to_s] = Blank.new
      elsif @@board[new_location].is_a?(Blank) && new_location[1] == '3' && location[0] != new_location[0]
        @@board[new_location] = Pawn.new(colour, new_location)
        @@board[new_location[0] + (new_location[1].to_i + 1).to_s] = Blank.new
      else
        @@board[new_location] = Pawn.new(colour, new_location)
      end
    elsif @@board[location].is_a?(Rook)
      @@board[new_location] = Rook.new(colour, new_location)
    elsif @@board[location].is_a?(Bishop)
      @@board[new_location] = Bishop.new(colour, new_location)
    elsif @@board[location].is_a?(Knight)
      @@board[new_location] = Knight.new(colour, new_location)
    elsif @@board[location].is_a?(Queen)
      @@board[new_location] = Queen.new(colour, new_location)
    elsif @@board[location].is_a?(King)
      if new_location == 'G1'
        @@board['G1'] = King.new('white', 'G1')
        @@board['F1'] = Rook.new('white', 'F1')
        @@board['H1'] = Blank.new
      elsif new_location == 'C1'
        @@board['C1'] = King.new('white', 'C1')
        @@board['D1'] = Rook.new('white', 'D1')
        @@board['A1'] = Blank.new
      elsif new_location == 'G8'
        @@board['G8'] = King.new('black', 'G8')
        @@board['F8'] = Rook.new('black', 'F8')
        @@board['H8'] = Blank.new
      elsif new_location == 'C8'
        @@board['C8'] = King.new('black', 'C8')
        @@board['D8'] = Rook.new('black', 'D8')
        @@board['A8'] = Blank.new
      else
        @@board[new_location] = King.new(colour, new_location)
      end
    end

    if new_location.is_a?(Blank)
    elsif new_location.nil?
    else
      @@board[location] = Blank.new
    end

    @@last_move_start = location
    return
  end

  def where_to_move(position, colour)
    moves = @@board[position].valid_positions(position, @@board)
    valid = false
    if moves.empty?
      puts "This piece has no valid moves, select a different piece"
      make_move
    else
      until valid
        puts "Pick a position to move your piece ('back' to go back)"
        location = gets.chomp.upcase
        if moves.include?(location)
          board_dupe = @@board.dup
          board_dupe[location] = @@board[position].class.new(colour, location)
          board_dupe[position] = Blank.new
          king = ''
          board_dupe.each do |key, value|
            if colour == 'black' && value.symbol == '♚'
              king = key
            elsif colour == 'white' && value.symbol == '♔'
              king = key
            end
          end
          check = king_check(king, colour, board_dupe)
          if check
            puts "This move would put your king in check"
          else
            valid = true
          end
        elsif @@board.key?(location)
          puts "This piece cannot move here"
        elsif location == 'BACK'
          valid = true
        else
          puts "This is not a position on the board"
        end
      end
      if location == 'BACK'
        make_move
      else
        location
      end
    end
  end

  def pawn_change
    if @current_player == @player1
      array = ['A8', 'B8', 'C8', 'D8', 'E8', 'F8', 'G8', 'H8']
      array.each do |key|
        if @@board[key].is_a?(Pawn)
          valid = false
          until valid
            puts "What would you like to turn your pawn into: Rook, Bishop, Knight, Queen"
            input = gets.chomp.downcase
            if input == 'rook'
              @@board[key] = Rook.new('white', key)
              valid = true
            elsif input == 'bishop'
              @@board[key] = Bishop.new('white', key)
              valid = true
            elsif input == 'knight'
              @@board[key] = Knight.new('white', key)
              valid = true
            elsif input == 'queen'
              @@board[key] = Queen.new('white', key)
              valid = true
            else
              puts "Please enter a valid piece name"
            end
          end
        end
      end
    else
      array = ['A1', 'B1', 'C1', 'D1', 'E1', 'F1', 'G1', 'H1']
      array.each do |key|
        if @@board[key].is_a?(Pawn)
          valid = false
          until valid
            puts "What would you like to turn your pawn into: Rook, Bishop, Knight, Queen"
            input = gets.chomp.downcase
            if input == 'rook'
              @@board[key] = Rook.new('black', key)
              valid = true
            elsif input == 'bishop'
              @@board[key] = Bishop.new('black', key)
              valid = true
            elsif input == 'knight'
              @@board[key] = Knight.new('black', key)
              valid = true
            elsif input == 'queen'
              @@board[key] = Queen.new('black', key)
              valid = true
            else
              puts "Please enter a valid piece name"
            end
          end
        end
      end
    end
  end

  def play
    win = false
    until win
      make_move
      pawn_change
      change_player
      print_board
      if @current_player == @player1
        king = ''
        @@board.each do |key, value|
          if value.symbol == '♔'
            king = key
          end
        end
        if king_check(king, 'white', @@board)
          if checkmate(king, 'white')
            puts "Checkmate"
            win = true
          else
            puts "Check"
          end
        end
      else
        king = ''
        @@board.each do |key, value|
          if value.symbol == '♚'
            king = key
          end
        end
        if king_check(king, 'black', @@board)
          if checkmate(king, 'black')
            puts "Checkmate"
            win = true
          else
            puts "Check"
          end
        end
      end
    end
    change_player
    puts "Well done, #{@current_player} is the winner."
  end
end

class Rook < Game
  attr_accessor :symbol, :colour, :unmoved
  def initialize(colour, position, moved='')
    if colour == 'black'
      @symbol = '♜'
      @colour = 'black'
    else
      @symbol = '♖'
      @colour = 'white'
    end
    @position = position

    if moved == 'unmoved'
      @unmoved = true
    else
      @unmoved = false
    end
  end

  def valid_positions(position, board)
    positions = []
    positions.push(valid_positions_right(position, board))
    positions.push(valid_positions_left(position, board))
    positions.push(valid_positions_up(position, board))
    positions.push(valid_positions_down(position, board))
    positions.flatten!
    positions
  end
end

class Knight < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♞'
      @colour = 'black'
    else
      @symbol = '♘'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    left_column = (position_letter.ord - 1).chr
    row_down = (position_number.to_i - 1).to_s
    right_column = (position_letter.ord + 1).chr
    row_up2 = (position_number.to_i + 2).to_s
    left_column2 = (position_letter.ord - 2).chr
    row_down2 = (position_number.to_i - 2).to_s
    right_column2 = (position_letter.ord + 2).chr
    if position_letter != 'H' && position_number != '7' &&
       position_number != '8' && board[(right_column + row_up2)].is_a?(Blank)
      positions.push(right_column + row_up2)
    elsif position_letter != 'H' && position_number != '7' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column + row_up2)].symbol)
          positions.push(right_column + row_up2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column + row_up2)].symbol)
          positions.push(right_column + row_up2)
        end
      end
    end
    if position_letter != 'G' && position_letter != 'H' &&
       position_number != '8' && board[(right_column2 + row_up)].is_a?(Blank)
      positions.push(right_column2 + row_up)
    elsif position_letter != 'G' && position_letter != 'H' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column2 + row_up)].symbol)
          positions.push(right_column2 + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column2 + row_up)].symbol)
          positions.push(right_column2 + row_up)
        end
      end
    end
    if position_letter != 'G' && position_letter != 'H' &&
       position_number != '1' && board[(right_column2 + row_down)].is_a?(Blank)
      positions.push(right_column2 + row_down)
    elsif position_letter != 'G' && position_letter != 'H' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column2 + row_down)].symbol)
          positions.push(right_column2 + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column2 + row_down)].symbol)
          positions.push(right_column2 + row_down)
        end
      end
    end
    if position_letter != 'H' && position_number != '2' &&
       position_number != '1' && board[(right_column + row_down2)].is_a?(Blank)
      positions.push(right_column + row_down2)
    elsif position_letter != 'H' && position_number != '2' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column + row_down2)].symbol)
          positions.push(right_column + row_down2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column + row_down2)].symbol)
          positions.push(right_column + row_down2)
        end
      end
    end
    if position_letter != 'A' && position_number != '2' &&
       position_number != '1' && board[(left_column + row_down2)].is_a?(Blank)
      positions.push(left_column + row_down2)
    elsif position_letter != 'A' && position_number != '2' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column + row_down2)].symbol)
          positions.push(left_column + row_down2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column + row_down2)].symbol)
          positions.push(left_column + row_down2)
        end
      end
    end
    if position_letter != 'A' && position_letter != 'B' &&
       position_number != '1' && board[(left_column2 + row_down)].is_a?(Blank)
      positions.push(left_column2 + row_down)
    elsif position_letter != 'A' && position_letter != 'B' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column2 + row_down)].symbol)
          positions.push(left_column2 + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column2 + row_down)].symbol)
          positions.push(left_column2 + row_down)
        end
      end
    end
    if position_letter != 'A' && position_letter != 'B' &&
       position_number != '8' && board[(left_column2 + row_up)].is_a?(Blank)
      positions.push(left_column2 + row_up)
    elsif position_letter != 'A' && position_letter != 'B' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column2 + row_up)].symbol)
          positions.push(left_column2 + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column2 + row_up)].symbol)
          positions.push(left_column2 + row_up)
        end
      end
    end
    if position_letter != 'A' && position_number != '7' &&
       position_number != '8' && board[(left_column + row_up2)].is_a?(Blank)
      positions.push(left_column + row_up2)
    elsif position_letter != 'A' && position_number != '7' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column + row_up2)].symbol)
          positions.push(left_column + row_up2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column + row_up2)].symbol)
          positions.push(left_column + row_up2)
        end
      end
    end
    positions
  end
end

class Bishop < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♝'
      @colour = 'black'
    else
      @symbol = '♗'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position, board)
    positions = []
    positions.push(valid_positions_up_right(position, board))
    positions.push(valid_positions_down_right(position, board))
    positions.push(valid_positions_down_left(position, board))
    positions.push(valid_positions_up_left(position, board))
    positions.flatten!
    positions
  end
end

class Queen < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♛'
      @colour = 'black'
    else
      @symbol = '♕'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position, board)
    positions = []
    positions.push(valid_positions_up_right(position, board))
    positions.push(valid_positions_down_right(position, board))
    positions.push(valid_positions_down_left(position, board))
    positions.push(valid_positions_up_left(position, board))
    positions.push(valid_positions_right(position, board))
    positions.push(valid_positions_left(position, board))
    positions.push(valid_positions_up(position, board))
    positions.push(valid_positions_down(position, board))
    positions.flatten!
    positions
  end
end

class King < Game
  attr_accessor :symbol, :colour, :unmoved
  def initialize(colour, position, moved='')
    if colour == 'black'
      @symbol = '♚'
      @colour = 'black'
    else
      @symbol = '♔'
      @colour = 'white'
    end
    @position = position

    if moved == 'unmoved'
      @unmoved = true
    else
      @unmoved = false
    end
  end

  def valid_positions(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    left_column = (position_letter.ord - 1).chr
    row_down = (position_number.to_i - 1).to_s
    right_column = (position_letter.ord + 1).chr
    if row_up != '9' && board[(position_letter + row_up)].is_a?(Blank)
      positions.push(position_letter + row_up)
    elsif row_up != '9'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(position_letter + row_up)].symbol)
          positions.push(position_letter + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(position_letter + row_up)].symbol) 
          positions.push(position_letter + row_up)
        end
      end
    end
    if row_up != '9' && right_column != 'I' && board[(right_column + row_up)].is_a?(Blank)
      positions.push(right_column + row_up)
    elsif row_up != '9' && right_column != 'I'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column + row_up)].symbol)
          positions.push(right_column + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column + row_up)].symbol)
          positions.push(right_column + row_up)
        end
      end
    end
    if right_column != 'I' && board[(right_column + position_number)].is_a?(Blank)
      positions.push(right_column + position_number)
    elsif right_column != 'I'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column + position_number)].symbol)
          positions.push(right_column + position_number)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column + position_number)].symbol) 
          positions.push(right_column + position_number)
        end
      end
    end
    if right_column != 'I' && row_down != '0' && board[(right_column + row_down)].is_a?(Blank)
      positions.push(right_column + row_down)
    elsif right_column != 'I' && row_down != '0'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(right_column + row_down)].symbol)
          positions.push(right_column + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(right_column + row_down)].symbol) 
          positions.push(right_column + row_down)
        end
      end
    end
    if row_down != '0' && board[(position_letter + row_down)].is_a?(Blank)
      positions.push(position_letter + row_down)
    elsif row_down != '0'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(position_letter + row_down)].symbol)
          positions.push(position_letter + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(position_letter + row_down)].symbol) 
          positions.push(position_letter + row_down)
        end
      end
    end
    if row_down != '0' && left_column != '@' && board[(left_column + row_down)].is_a?(Blank)
      positions.push(left_column + row_down)
    elsif row_down != '0' && left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column + row_down)].symbol)
          positions.push(left_column + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column + row_down)].symbol) 
          positions.push(left_column + row_down)
        end
      end
    end
    if left_column != '@' && board[(left_column + position_number)].is_a?(Blank)
      positions.push(left_column + position_number)
    elsif left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column + position_number)].symbol)
          positions.push(left_column + position_number)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column + position_number)].symbol) 
          positions.push(left_column + position_number)
        end
      end
    end
    if row_up != '9' && left_column != '@' && board[(left_column + row_up)].is_a?(Blank)
      positions.push(left_column + row_up)
    elsif row_up != '9' && left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[(left_column + row_up)].symbol)
          positions.push(left_column + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(board[(left_column + row_up)].symbol) 
          positions.push(left_column + row_up)
        end
      end
    end

    # castling king
    if @colour == 'white' && board['E1'].is_a?(King)
      king_found = board.any? do |key, value|
        if value.symbol == '♚'
          true
        end
      end
      if castle_right('white') && king_found
        positions.push('G1')
      end
      if castle_left('white') && king_found
        positions.push('C1')
      end
    elsif @colour == 'black' && board['E8'].is_a?(King)
      king_found = board.any? do |key, value|
        if value.symbol == '♔'
          true
        end
      end
      if castle_right('black') && king_found
        positions.push('G8')
      end
      if castle_left('black') && king_found
        positions.push('C8')
      end
    end
    positions
  end

  def castle_right(colour)
    if colour == 'white'
      board = @@board.dup
      board1 = @@board.dup
      board1['E1'] = Blank.new
      board1['F1'] = King.new('white', 'F1')
      board2 = @@board.dup
      board2['E1'] = Blank.new
      board2['G1'] = King.new('white', 'G1')
      board3 = @@board.dup
      board3['E1'] = Blank.new
      board3['H1'] = King.new('white', 'H1')
      if @@board['E8'].is_a?(King)
        board['E8'] = Blank.new
        board1['E8'] = Blank.new
        board2['E8'] = Blank.new
        board3['E8'] = Blank.new
      end
      king = @@board['E1']
      rook = @@board['H1']
      if king.symbol != '♔' || rook.symbol != '♖' || !@@board['F1'].is_a?(Blank) || !@@board['G1'].is_a?(Blank)
        false
      elsif !king.unmoved || !rook.unmoved
        false
      elsif king_check('E1', 'white', board) || king_check('F1', 'white', board1) || king_check('G1', 'white', board2) || king_check('H1', 'white', board3)
        false
      else
        true
      end
    else
      board = @@board.dup
      board1 = @@board.dup
      board1['E8'] = Blank.new
      board1['F8'] = King.new('black', 'F8')
      board2 = @@board.dup
      board2['E8'] = Blank.new
      board2['G8'] = King.new('black', 'G8')
      board3 = @@board.dup
      board3['E8'] = Blank.new
      board3['H8'] = King.new('black', 'H8')
      if @@board['E1'].is_a?(King)
        board['E1'] = Blank.new
        board1['E1'] = Blank.new
        board2['E1'] = Blank.new
        board3['E1'] = Blank.new
      end
      king = @@board['E8']
      rook = @@board['H8']
      if king.symbol != '♚' || rook.symbol != '♜' || !@@board['F8'].is_a?(Blank) || !@@board['G8'].is_a?(Blank)
        false
      elsif !king.unmoved || !rook.unmoved
        false
      elsif king_check('E8', 'black', board) || king_check('F8', 'black', board1) || king_check('G8', 'black', board2) || king_check('H8', 'black', board3)
        false
      else
        true
      end
    end
  end

  def castle_left(colour)
    if colour == 'white'
      board = @@board.dup
      board1 = @@board.dup
      board1['E1'] = Blank.new
      board1['D1'] = King.new('white', 'D1')
      board2 = @@board.dup
      board2['E1'] = Blank.new
      board2['C1'] = King.new('white', 'C1')
      board3 = @@board.dup
      board3['E1'] = Blank.new
      board3['B1'] = King.new('white', 'B1')
      board4 = @@board.dup
      board4['E1'] = Blank.new
      board4['A1'] = King.new('white', 'A1')
      if @@board['E8'].is_a?(King)
        board['E8'] = Blank.new
        board1['E8'] = Blank.new
        board2['E8'] = Blank.new
        board3['E8'] = Blank.new
        board4['E8'] = Blank.new
      end
      king = @@board['E1']
      rook = @@board['A1']
      if king.symbol != '♔' || rook.symbol != '♖' || !@@board['B1'].is_a?(Blank) || !@@board['C1'].is_a?(Blank) || !@@board['D1'].is_a?(Blank)
        false
      elsif !king.unmoved || !rook.unmoved
        false
      elsif king_check('E1', 'white', board) || king_check('D1', 'white', board1) || king_check('C1', 'white', board2) || king_check('B1', 'white', board3) || king_check('A1', 'white', board4)
        false
      else
        true
      end
    else
      board = @@board.dup
      board1 = @@board.dup
      board1['E8'] = Blank.new
      board1['D8'] = King.new('black', 'D8')
      board2 = @@board.dup
      board2['E8'] = Blank.new
      board2['C8'] = King.new('black', 'C8')
      board3 = @@board.dup
      board3['E8'] = Blank.new
      board3['B8'] = King.new('black', 'B8')
      board4 = @@board.dup
      board4['E8'] = Blank.new
      board4['A8'] = King.new('black', 'A8')
      if @@board['E1'].is_a?(King)
        board['E1'] = Blank.new
        board1['E1'] = Blank.new
        board2['E1'] = Blank.new
        board3['E1'] = Blank.new
        board4['E1'] = Blank.new
      end
      king = @@board['E8']
      rook = @@board['A8']
      if king.symbol != '♚' || rook.symbol != '♜' || !@@board['B8'].is_a?(Blank) || !@@board['C8'].is_a?(Blank) || !@@board['D8'].is_a?(Blank)
        false
      elsif !king.unmoved || !rook.unmoved
        false
      elsif king_check('E8', 'black', board) || king_check('D8', 'black', board1) || king_check('C8', 'black', board2) || king_check('B8', 'black', board3) || king_check('A8', 'black', board4)
        false
      else
        true
      end
    end
  end
end

class Pawn < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♟︎'
      @colour = 'black'
    else
      @symbol = '♙'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position, board)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    if @symbol == '♟︎' ## black
      if position_number != '7'
        if board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
        end
      else
        if board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank) && board[position_letter + (position_number.to_i - 2).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
          positions.push(position_letter + (position_number.to_i - 2).to_s)
        elsif board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
        end
      end
      ## checking whether front right and front left are able to be attacked
      unless position_letter == 'A'
        left_column = (position_letter.ord - 1).chr
        unless board[left_column + (position_number.to_i - 1).to_s].is_a?(Blank) ||
               ['♟', '♞', '♝', '♜', '♛', '♚︎'].include?(board[left_column + (position_number.to_i - 1).to_s].symbol)
          positions.push(left_column + (position_number.to_i - 1).to_s)
        end
      end
      unless position_letter == 'H'
        right_column = (position_letter.ord + 1).chr
        unless board[right_column + (position_number.to_i - 1).to_s].is_a?(Blank) ||
               ['♟', '♞', '♝', '♜', '♛', '♚︎'].include?(board[right_column + (position_number.to_i - 1).to_s].symbol)
          positions.push(right_column + (position_number.to_i - 1).to_s)
        end
      end
    else
      if position_number != '2'
        if board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
        end
      else
        if board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank) && board[position_letter + (position_number.to_i + 2).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
          positions.push(position_letter + (position_number.to_i + 2).to_s)
        elsif board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
        end
      end
      ## checking whether front right and front left are able to be attacked
      unless position_letter == 'A'
        left_column = (position_letter.ord - 1).chr
        unless board[left_column + (position_number.to_i + 1).to_s].is_a?(Blank) ||
               ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[left_column + (position_number.to_i + 1).to_s].symbol)
          positions.push(left_column + (position_number.to_i + 1).to_s)
        end
      end
      unless position_letter == 'H'
        right_column = (position_letter.ord + 1).chr
        unless board[right_column + (position_number.to_i + 1).to_s].is_a?(Blank) ||
               ['♙', '♘', '♗', '♖', '♕', '♔'].include?(board[right_column + (position_number.to_i + 1).to_s].symbol)
          positions.push(right_column + (position_number.to_i + 1).to_s)
        end
      end
    end

    # en passant capture
    positions.push(passant_right(position, colour))
    positions.push(passant_left(position, colour))
    positions.flatten!
    positions
  end

  def passant_right(position, colour)
    positions = []
    right = (position[0].ord + 1).chr
    if colour == 'white'
      if position[0] == 'H' || position[1] != '5'
        positions
      elsif @@board[(right + position[1])].symbol != '♟︎'
        positions
      elsif @@last_move_start[1] != '7'
        positions
      else
        positions.push(right + (position[1].to_i + 1).to_s)
      end
    else
      if position[0] == 'H' || position[1] != '4'
        positions
      elsif @@board[(right + position[1])].symbol != '♙'
        positions
      elsif @@last_move_start[1] != '2'
        positions
      else
        positions.push(right + (position[1].to_i - 1).to_s)
      end
    end
    positions
  end

  def passant_left(position, colour)
    positions = []
    left = (position[0].ord - 1).chr
    if colour == 'white'
      if position[0] == 'A' || position[1] != '5'
        positions
      elsif @@board[(left + position[1])].symbol != '♟︎'
        positions
      elsif @@last_move_start[1] != '7'
        positions
      else
        positions.push(left + (position[1].to_i + 1).to_s)
      end
    else
      if position[0] == 'A' || position[1] != '4'
        positions
      elsif @@board[(left + position[1])].symbol != '♙'
        positions
      elsif @@last_move_start[1] != '2'
        positions
      else
        positions.push(left + (position[1].to_i - 1).to_s)
      end
    end
    positions
  end
end

class Blank
  attr_accessor :symbol
  def initialize
    @symbol = '·'
  end
end

game = Game.new
game.print_board
game.play