class Mastermind
  COLORS = %w[red blue green yellow orange purple]

  def initialize
    @secret_code = generate_secret_code
    @attempts = 10
  end

  def play
    puts "Welcome to Mastermind!"
    @attempts.times do |attempt|
      puts "\nAttempt #{attempt + 1} of #{@attempts}"
      guess = get_player_guess
      if guess == @secret_code
        puts "Congratulations! You've cracked the code!"
        return
      else
        feedback = provide_feedback(guess)
        puts "Feedback: #{feedback[:black]} black peg(s), #{feedback[:white]} white peg(s)"
      end
    end
    puts "\nSorry, you've run out of attempts. The code was #{@secret_code.join(', ')}."
  end

  private

  def generate_secret_code
    COLORS.sample(4)
  end

  def get_player_guess
    loop do
      print "Enter your guess (e.g., red blue green yellow): "
      input = gets.chomp.downcase.split
      if valid_guess?(input)
        return input
      else
        puts "Invalid guess. Please use four colors from: #{COLORS.join(', ')}."
      end
    end
  end

  def valid_guess?(guess)
    guess.length == 4 && guess.all? { |color| COLORS.include?(color) }
  end

  def provide_feedback(guess)
    black = 0
    white = 0
    secret_copy = @secret_code.dup
    guess_copy = guess.dup

    guess_copy.each_with_index do |color, index|
      if color == secret_copy[index]
        black += 1
        secret_copy[index] = nil
        guess_copy[index] = nil
      end
    end

    guess_copy.compact.each do |color|
      if secret_copy.include?(color)
        white += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end

    { black: black, white: white }
  end
end

game = Mastermind.new
game.play
