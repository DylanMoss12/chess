class Game
  def initialize
    puts "Welcome to your game of chess"
    print "Player 1 name: "
    @player1 = gets.chomp
    print "Player 2 name: "
    @player2 = gets.chomp

    @board = {
      A1: Rook.new('white'),
      B1: Knight.new('white'),
      C1: Bishop.new('white'),
      D1: Queen.new('white'),
      E1: King.new('white'),
      F1: Bishop.new('white'),
      G1: Knight.new('white'),
      H1: Rook.new('white'),
      A2: Pawn.new('white'),
      B2: Pawn.new('white'),
      C2: Pawn.new('white'),
      D2: Pawn.new('white'),
      E2: Pawn.new('white'),
      F2: Pawn.new('white'),
      G2: Pawn.new('white'),
      H2: Pawn.new('white'),
      A3: Blank.new,
      B3: Blank.new,
      C3: Blank.new,
      D3: Blank.new,
      E3: Blank.new,
      F3: Blank.new,
      G3: Blank.new,
      H3: Blank.new,
      A4: Blank.new,
      B4: Blank.new,
      C4: Blank.new,
      D4: Blank.new,
      E4: Blank.new,
      F4: Blank.new,
      G4: Blank.new,
      H4: Blank.new,
      A5: Blank.new,
      B5: Blank.new,
      C5: Blank.new,
      D5: Blank.new,
      E5: Blank.new,
      F5: Blank.new,
      G5: Blank.new,
      H5: Blank.new,
      A6: Blank.new,
      B6: Blank.new,
      C6: Blank.new,
      D6: Blank.new,
      E6: Blank.new,
      F6: Blank.new,
      G6: Blank.new,
      H6: Blank.new,
      A7: Pawn.new('black'),
      B7: Pawn.new('black'),
      C7: Pawn.new('black'),
      D7: Pawn.new('black'),
      E7: Pawn.new('black'),
      F7: Pawn.new('black'),
      G7: Pawn.new('black'),
      H7: Pawn.new('black'),
      A8: Rook.new('black'),
      B8: Knight.new('black'),
      C8: Bishop.new('black'),
      D8: Queen.new('black'),
      E8: King.new('black'),
      F8: Bishop.new('black'),
      G8: Knight.new('black'),
      H8: Rook.new('black')
    }
  end

  def print_board
    print '8 ', @board[:A8].symbol, ' ', @board[:B8].symbol, ' ', @board[:C8].symbol, ' ', @board[:D8].symbol, ' ', @board[:E8].symbol, ' ', @board[:F8].symbol, ' ', @board[:G8].symbol, ' ', @board[:H8].symbol, "\n"
    print '7 ', @board[:A7].symbol, ' ', @board[:B7].symbol, ' ', @board[:C7].symbol, ' ', @board[:D7].symbol, ' ', @board[:E7].symbol, ' ', @board[:F7].symbol, ' ', @board[:G7].symbol, ' ', @board[:H7].symbol, "\n"
    print '6 ', @board[:A6].symbol, ' ', @board[:B6].symbol, ' ', @board[:C6].symbol, ' ', @board[:D6].symbol, ' ', @board[:E6].symbol, ' ', @board[:F6].symbol, ' ', @board[:G6].symbol, ' ', @board[:H6].symbol, "\n"
    print '5 ', @board[:A5].symbol, ' ', @board[:B5].symbol, ' ', @board[:C5].symbol, ' ', @board[:D5].symbol, ' ', @board[:E5].symbol, ' ', @board[:F5].symbol, ' ', @board[:G5].symbol, ' ', @board[:H5].symbol, "\n"
    print '4 ', @board[:A4].symbol, ' ', @board[:B4].symbol, ' ', @board[:C4].symbol, ' ', @board[:D4].symbol, ' ', @board[:E4].symbol, ' ', @board[:F4].symbol, ' ', @board[:G4].symbol, ' ', @board[:H4].symbol, "\n"
    print '3 ', @board[:A3].symbol, ' ', @board[:B3].symbol, ' ', @board[:C3].symbol, ' ', @board[:D3].symbol, ' ', @board[:E3].symbol, ' ', @board[:F3].symbol, ' ', @board[:G3].symbol, ' ', @board[:H3].symbol, "\n"
    print '2 ', @board[:A2].symbol, ' ', @board[:B2].symbol, ' ', @board[:C2].symbol, ' ', @board[:D2].symbol, ' ', @board[:E2].symbol, ' ', @board[:F2].symbol, ' ', @board[:G2].symbol, ' ', @board[:H2].symbol, "\n"
    print '1 ', @board[:A1].symbol, ' ', @board[:B1].symbol, ' ', @board[:C1].symbol, ' ', @board[:D1].symbol, ' ', @board[:E1].symbol, ' ', @board[:F1].symbol, ' ', @board[:G1].symbol, ' ', @board[:H1].symbol, "\n"
    print '  A B C D E F G H', "\n"
  end
end

class Rook
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♜'
    else
      @symbol = '♖'
    end
  end
end

class Knight
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♞'
    else
      @symbol = '♘'
    end
  end
end

class Bishop
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♝'
    else
      @symbol = '♗'
    end
  end
end

class Queen
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♛'
    else
      @symbol = '♕'
    end
  end
end

class King
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♚'
    else
      @symbol = '♔'
    end
  end
end

class Pawn
  attr_accessor :symbol
  def initialize(colour)
    if colour == 'black'
      @symbol = '♟︎'
    else
      @symbol = '♙'
    end
  end
end

class Blank
  attr_accessor :symbol
  def initialize
    @symbol = '*'
  end
end

game = Game.new
game.print_board