# frozen_string_literal: true

# Build a tic-tac-toe game on the command line where two human players can
# play against each other and the board is displayed in between turns.

# Think about how you would set up the different elements within the game… What should be a class?
# Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
# Build your game, taking care to not share information between classes any more than you have to.
# Post your solution below, then check out this example Tic Tac Toe solution from RosettaCode.org.
class TicTacToe
  # El método `initialize` se ejecuta cuando se crea una nueva instancia del juego
  def initialize
    # Creamos un tablero vacío de 3x3, representado por una matriz de matrices
    @board = Array.new(3) { Array.new(3, " ") }
    # El primer jugador será "X"
    @current_player = "X"
  end

  # Este es el método principal que controla el flujo del juego
  def play
    # Un bucle infinito que se ejecuta hasta que haya un ganador o empate
    loop do
      display_board      # Mostramos el tablero actual
      player_move        # Pedimos al jugador que haga su jugada
      if winner?         # Verificamos si hay un ganador
        display_board    # Mostramos el tablero final con la jugada ganadora
        puts "Player #{@current_player} wins!"  # Anunciamos al ganador
        break           # Salimos del bucle para terminar el juego
      elsif draw?        # Verificamos si el tablero está lleno y hay un empate
        display_board    # Mostramos el tablero final
        puts "It's a draw!"  # Anunciamos el empate
        break           # Salimos del bucle para terminar el juego
      else
        switch_player    # Cambiamos el turno al otro jugador
      end
    end
  end

  # Método para mostrar el tablero en la consola
  def display_board
    puts ""  # Imprimimos una línea en blanco para separar la salida
    # Recorremos cada fila del tablero para imprimirla
    @board.each_with_index do |row, i|
      puts row.join(" | ")  # Imprimimos los valores de la fila separados por " | "
      # Imprimimos una línea de separación entre las filas, excepto después de la última
      puts "--+---+--" unless i == 2
    end
    puts ""  # Otra línea en blanco al final
  end

  # Método que gestiona el movimiento del jugador
  def player_move
    # Pedimos al jugador que ingrese las coordenadas de su movimiento (fila y columna)
    puts "Player #{@current_player}, enter your move (row and column, 0-2 separated by a space):"
    # Leemos la entrada, dividimos en dos partes (fila y columna) y las convertimos a enteros
    row, col = gets.split.map(&:to_i)

    # Verificamos si el movimiento es válido (la casilla está dentro del tablero y está vacía)
    if valid_move?(row, col)
      @board[row][col] = @current_player  # Colocamos la marca del jugador en la casilla correspondiente
    else
      puts "Invalid move, try again."   # Si el movimiento no es válido, mostramos un mensaje de error
      player_move                       # Volvemos a pedir el movimiento (llamada recursiva)
    end
  end

  # Método que valida si un movimiento es válido
  def valid_move?(row, col)
    # El movimiento es válido si la fila y la columna están entre 0 y 2, y la casilla está vacía
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == " "
  end

  # Método para cambiar de jugador (alternar entre "X" y "O")
  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"  # Si es "X", lo cambiamos a "O" y viceversa
  end

  # Método que comprueba si alguien ha ganado
  def winner?
    rows_winner? || columns_winner? || diagonals_winner?  # Comprobamos filas, columnas y diagonales
  end

  # Verificamos si alguna fila tiene tres símbolos iguales
  def rows_winner?
    @board.any? { |row| row.all? { |cell| cell == @current_player } }
  end

  # Verificamos si alguna columna tiene tres símbolos iguales
  def columns_winner?
    @board.transpose.any? { |col| col.all? { |cell| cell == @current_player } }
  end

  # Verificamos si alguna de las diagonales tiene tres símbolos iguales
  def diagonals_winner?
    [@board, @board.map(&:reverse)].any? do |b|
      [0, 1, 2].all? { |i| b[i][i] == @current_player }
    end
  end

  # Método que verifica si hay un empate (ninguna casilla está vacía)
  def draw?
    # Convertimos el tablero en una lista 1D y verificamos si todas las casillas están llenas
    @board.flatten.none? { |cell| cell == " " }
  end
end

# Creamos una nueva instancia del juego
game = TicTacToe.new
# Iniciamos el juego
game.play
