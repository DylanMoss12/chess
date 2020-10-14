class Game
  attr_accessor :board
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

    @@board = {
      'A1' => Rook.new('white', 'A1'),
      'B1' => Knight.new('white', 'B1'),
      'C1' => Bishop.new('white', 'C1'),
      'D1' => Queen.new('white', 'D1'),
      'E1' => King.new('white', 'E1'),
      'F1' => Bishop.new('white', 'F1'),
      'G1' => Knight.new('white', 'G1'),
      'H1' => Rook.new('white', 'H1'),
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
      'A8' => Rook.new('black', 'A8'),
      'B8' => Knight.new('black', 'B8'),
      'C8' => Bishop.new('black', 'C8'),
      'D8' => Queen.new('black', 'D8'),
      'E8' => King.new('black', 'E8'),
      'F8' => Bishop.new('black', 'F8'),
      'G8' => Knight.new('black', 'G8'),
      'H8' => Rook.new('black', 'H8')
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

  def valid_positions_right(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until right_column == 'I' || piece_found
      new_position = (right_column + position_number)
      unless @@board[new_position].is_a?(Blank)
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
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

  def valid_positions_left(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until left_column == '@' || piece_found
      new_position = (left_column + position_number)
      unless @@board[new_position].is_a?(Blank)
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
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

  def valid_positions_up(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    piece_found = false
    until row_up == '9' || piece_found
      new_position = (position_letter + row_up)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_up = (row_up.to_i + 1).to_s
    end
    positions
  end

  def valid_positions_down(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    piece_found = false
    until row_down == '0' || piece_found
      new_position = (position_letter + row_down)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♜' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
    end
    positions
  end

  def valid_positions_up_right(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until row_up == '9' || right_column == 'I' || piece_found
      new_position = (right_column + row_up)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_up = (row_up.to_i + 1).to_s
      right_column = (right_column.ord + 1).chr
    end
    positions
  end

  def valid_positions_down_right(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    right_column = (position_letter.ord + 1).chr
    piece_found = false
    until row_down == '0' || right_column == 'I' || piece_found
      new_position = (right_column + row_down)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
      right_column = (right_column.ord + 1).chr
    end
    positions
  end

  def valid_positions_down_left(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_down = (position_number.to_i - 1).to_s
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until row_down == '0' || left_column == '@' || piece_found
      new_position = (left_column + row_down)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
            positions.push(new_position)
          end
        end
      end
      row_down = (row_down.to_i - 1).to_s
      left_column = (left_column.ord - 1).chr
    end
    positions
  end

  def valid_positions_up_left(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    left_column = (position_letter.ord - 1).chr
    piece_found = false
    until row_up == '9' || left_column == '@' || piece_found
      new_position = (left_column + row_up)
      if @@board[new_position].is_a?(Blank)
        positions.push(new_position)
      else
        piece_found = true
        if @symbol == '♝' || @symbol == '♛'
          if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[new_position].symbol)
            positions.push(new_position)
          end
        else
          if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[new_position].symbol) 
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

  def king_check(position)
    in_check = false
    all_valid_positions = []
    if @@board[position].symbol == '♚'
      colour = 'black'
    else
      colour = 'white'
    end
    @@board.each do |key, value|
      if colour == 'black'
        if !value.is_a?(Blank) && ['♙', '♘', '♗', '♖', '♕', '♔'].include?(value.symbol)
          all_valid_positions.push(value.valid_positions(key))
        end
      else
        if !value.is_a?(Blank) && ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(value.symbol)
          all_valid_positions.push(value.valid_positions(key))
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
    
    new_location = where_to_move(piece)
    if @@board[location].is_a?(Pawn)
      @@board[new_location] = Pawn.new(colour, new_location)
    elsif @@board[location].is_a?(Rook)
      @@board[new_location] = Rook.new(colour, new_location)
    elsif @@board[location].is_a?(Bishop)
      @@board[new_location] = Bishop.new(colour, new_location)
    elsif @@board[location].is_a?(Knight)
      @@board[new_location] = Knight.new(colour, new_location)
    elsif @@board[location].is_a?(Queen)
      @@board[new_location] = Queen.new(colour, new_location)
    elsif @@board[location].is_a?(King)
      @@board[new_location] = King.new(colour, new_location)
    end
    if new_location.is_a?(Blank)
    elsif new_location.nil?
    else
      @@board[location] = Blank.new
    end
  end

  def where_to_move(location)
    moves = @@board[location].valid_positions(location)
    valid = false
    if moves.empty?
      puts "This piece has no valid moves, select a different piece"
      make_move
    else
      until valid
        puts "Pick a position to move your piece ('back' to go back)"
        location = gets.chomp.upcase
        if moves.include?(location)
          valid = true
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
end

class Rook < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♜'
      @colour = 'black'
    else
      @symbol = '♖'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position)
    positions = []
    positions.push(valid_positions_right(position))
    positions.push(valid_positions_left(position))
    positions.push(valid_positions_up(position))
    positions.push(valid_positions_down(position))
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

  def valid_positions(position)
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
       position_number != '8' && @@board[(right_column + row_up2)].is_a?(Blank)
      positions.push(right_column + row_up2)
    elsif position_letter != 'H' && position_number != '7' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column + row_up2)].symbol)
          positions.push(right_column + row_up2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column + row_up2)].symbol)
          positions.push(right_column + row_up2)
        end
      end
    end
    if position_letter != 'G' && position_letter != 'H' &&
       position_number != '8' && @@board[(right_column2 + row_up)].is_a?(Blank)
      positions.push(right_column2 + row_up)
    elsif position_letter != 'G' && position_letter != 'H' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column2 + row_up)].symbol)
          positions.push(right_column2 + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column2 + row_up)].symbol)
          positions.push(right_column2 + row_up)
        end
      end
    end
    if position_letter != 'G' && position_letter != 'H' &&
       position_number != '1' && @@board[(right_column2 + row_down)].is_a?(Blank)
      positions.push(right_column2 + row_down)
    elsif position_letter != 'G' && position_letter != 'H' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column2 + row_down)].symbol)
          positions.push(right_column2 + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column2 + row_down)].symbol)
          positions.push(right_column2 + row_down)
        end
      end
    end
    if position_letter != 'H' && position_number != '2' &&
       position_number != '1' && @@board[(right_column + row_down2)].is_a?(Blank)
      positions.push(right_column + row_down2)
    elsif position_letter != 'H' && position_number != '2' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column + row_down2)].symbol)
          positions.push(right_column + row_down2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column + row_down2)].symbol)
          positions.push(right_column + row_down2)
        end
      end
    end
    if position_letter != 'A' && position_number != '2' &&
       position_number != '1' && @@board[(left_column + row_down2)].is_a?(Blank)
      positions.push(left_column + row_down2)
    elsif position_letter != 'A' && position_number != '2' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column + row_down2)].symbol)
          positions.push(left_column + row_down2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column + row_down2)].symbol)
          positions.push(left_column + row_down2)
        end
      end
    end
    if position_letter != 'A' && position_letter != 'B' &&
       position_number != '1' && @@board[(left_column2 + row_down)].is_a?(Blank)
      positions.push(left_column2 + row_down)
    elsif position_letter != 'A' && position_letter != 'B' && position_number != '1'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column2 + row_down)].symbol)
          positions.push(left_column2 + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column2 + row_down)].symbol)
          positions.push(left_column2 + row_down)
        end
      end
    end
    if position_letter != 'A' && position_letter != 'B' &&
       position_number != '8' && @@board[(left_column2 + row_up)].is_a?(Blank)
      positions.push(left_column2 + row_up)
    elsif position_letter != 'A' && position_letter != 'B' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column2 + row_up)].symbol)
          positions.push(left_column2 + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column2 + row_up)].symbol)
          positions.push(left_column2 + row_up)
        end
      end
    end
    if position_letter != 'A' && position_number != '7' &&
       position_number != '8' && @@board[(left_column + row_up2)].is_a?(Blank)
      positions.push(left_column + row_up2)
    elsif position_letter != 'A' && position_number != '7' && position_number != '8'
      if @symbol == '♞'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column + row_up2)].symbol)
          positions.push(left_column + row_up2)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column + row_up2)].symbol)
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

  def valid_positions(position)
    positions = []
    positions.push(valid_positions_up_right(position))
    positions.push(valid_positions_down_right(position))
    positions.push(valid_positions_down_left(position))
    positions.push(valid_positions_up_left(position))
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

  def valid_positions(position)
    positions = []
    positions.push(valid_positions_up_right(position))
    positions.push(valid_positions_down_right(position))
    positions.push(valid_positions_down_left(position))
    positions.push(valid_positions_up_left(position))
    positions.push(valid_positions_right(position))
    positions.push(valid_positions_left(position))
    positions.push(valid_positions_up(position))
    positions.push(valid_positions_down(position))
    positions.flatten!
    positions
  end
end

class King < Game
  attr_accessor :symbol, :colour
  def initialize(colour, position)
    if colour == 'black'
      @symbol = '♚'
      @colour = 'black'
    else
      @symbol = '♔'
      @colour = 'white'
    end
    @position = position
  end

  def valid_positions(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    row_up = (position_number.to_i + 1).to_s
    left_column = (position_letter.ord - 1).chr
    row_down = (position_number.to_i - 1).to_s
    right_column = (position_letter.ord + 1).chr
    if row_up != '9' && @@board[(position_letter + row_up)].is_a?(Blank)
      positions.push(position_letter + row_up)
    elsif row_up != '9'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(position_letter + row_up)].symbol)
          positions.push(position_letter + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(position_letter + row_up)].symbol) 
          positions.push(position_letter + row_up)
        end
      end
    end
    if row_up != '9' && right_column != 'I' && @@board[(right_column + row_up)].is_a?(Blank)
      positions.push(right_column + row_up)
    elsif row_up != '9' && right_column != 'I'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column + row_up)].symbol)
          positions.push(right_column + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column + row_up)].symbol)
          positions.push(right_column + row_up)
        end
      end
    end
    if right_column != 'I' && @@board[(right_column + position_number)].is_a?(Blank)
      positions.push(right_column + position_number)
    elsif right_column != 'I'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column + position_number)].symbol)
          positions.push(right_column + position_number)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column + position_number)].symbol) 
          positions.push(right_column + position_number)
        end
      end
    end
    if right_column != 'I' && row_down != '0' && @@board[(right_column + row_down)].is_a?(Blank)
      positions.push(right_column + row_down)
    elsif right_column != 'I' && row_down != '0'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(right_column + row_down)].symbol)
          positions.push(right_column + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(right_column + row_down)].symbol) 
          positions.push(right_column + row_down)
        end
      end
    end
    if row_down != '0' && @@board[(position_letter + row_down)].is_a?(Blank)
      positions.push(position_letter + row_down)
    elsif row_down != '0'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(position_letter + row_down)].symbol)
          positions.push(position_letter + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(position_letter + row_down)].symbol) 
          positions.push(position_letter + row_down)
        end
      end
    end
    if row_down != '0' && left_column != '@' && @@board[(left_column + row_down)].is_a?(Blank)
      positions.push(left_column + row_down)
    elsif row_down != '0' && left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column + row_down)].symbol)
          positions.push(left_column + row_down)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column + row_down)].symbol) 
          positions.push(left_column + row_down)
        end
      end
    end
    if left_column != '@' && @@board[(left_column + position_number)].is_a?(Blank)
      positions.push(left_column + position_number)
    elsif left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column + position_number)].symbol)
          positions.push(left_column + position_number)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column + position_number)].symbol) 
          positions.push(left_column + position_number)
        end
      end
    end
    if row_up != '9' && left_column != '@' && @@board[(left_column + row_up)].is_a?(Blank)
      positions.push(left_column + row_up)
    elsif row_up != '9' && left_column != '@'
      if @symbol == '♚'
        if ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[(left_column + row_up)].symbol)
          positions.push(left_column + row_up)
        end
      else
        if ['♟︎', '♞', '♝', '♜', '♛', '♚'].include?(@@board[(left_column + row_up)].symbol) 
          positions.push(left_column + row_up)
        end
      end
    end
    positions
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

  def valid_positions(position)
    positions = []
    position_letter = position[0]
    position_number = position[1]
    if @symbol == '♟︎' ## black
      if position_number != '7'
        if @@board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
        end
      else
        if @@board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank) && @@board[position_letter + (position_number.to_i - 2).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
          positions.push(position_letter + (position_number.to_i - 2).to_s)
        elsif @@board[position_letter + (position_number.to_i - 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i - 1).to_s)
        end
      end
      ## checking whether front right and front left are able to be attacked
      unless position_letter == 'A'
        left_column = (position_letter.ord - 1).chr
        unless @@board[left_column + (position_number.to_i - 1).to_s].is_a?(Blank) ||
               ['♟', '♞', '♝', '♜', '♛', '♚︎'].include?(@@board[left_column + (position_number.to_i - 1).to_s].symbol)
          positions.push(left_column + (position_number.to_i - 1).to_s)
        end
      end
      unless position_letter == 'H'
        right_column = (position_letter.ord + 1).chr
        unless @@board[right_column + (position_number.to_i - 1).to_s].is_a?(Blank) ||
               ['♟', '♞', '♝', '♜', '♛', '♚︎'].include?(@@board[right_column + (position_number.to_i - 1).to_s].symbol)
          positions.push(right_column + (position_number.to_i - 1).to_s)
        end
      end
    else
      if position_number != '2'
        if @@board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
        end
      else
        if @@board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank) && @@board[position_letter + (position_number.to_i + 2).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
          positions.push(position_letter + (position_number.to_i + 2).to_s)
        elsif @@board[position_letter + (position_number.to_i + 1).to_s].is_a?(Blank)
          positions.push(position_letter + (position_number.to_i + 1).to_s)
        end
      end
      ## checking whether front right and front left are able to be attacked
      unless position_letter == 'A'
        left_column = (position_letter.ord - 1).chr
        unless @@board[left_column + (position_number.to_i + 1).to_s].is_a?(Blank) ||
               ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[left_column + (position_number.to_i + 1).to_s].symbol)
          positions.push(left_column + (position_number.to_i + 1).to_s)
        end
      end
      unless position_letter == 'H'
        right_column = (position_letter.ord + 1).chr
        unless @@board[right_column + (position_number.to_i + 1).to_s].is_a?(Blank) ||
               ['♙', '♘', '♗', '♖', '♕', '♔'].include?(@@board[right_column + (position_number.to_i + 1).to_s].symbol)
          positions.push(right_column + (position_number.to_i + 1).to_s)
        end
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
game.make_move
game.print_board