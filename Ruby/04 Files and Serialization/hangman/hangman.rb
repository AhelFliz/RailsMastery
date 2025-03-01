require 'net/http'
require 'uri'
require 'set'

def download_dictionary(url, filename)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    File.open(filename, 'w') do |file|
      file.write(response.body)
    end
    puts "Dictionary downloaded successfully!"
  else
    puts "Failed to download dictionary. Status code: #{response.code}"
  end
end

# Function to load words from the dictionary file
def load_words(filename)
  words = []
  begin
    File.foreach(filename) do |line|
      word = line.strip
      words << word if word.length.between?(5, 12)
    end
  rescue Errno::ENOENT
    puts "Error: Dictionary file not found. Please make sure to download it first using download_dictionary"
    exit 1
  end
  words
end

# Function to choose a random secret word
def choose_secret_word(words)
  words.sample
end

# Function to initialize the game state
def initialize_game(secret_word)
  {
    secret_word: secret_word,
    guesses_left: 6,
    correct_letters: Set.new,
    incorrect_letters: Set.new,
    display: Array.new(secret_word.length, '_')
  }
end

# Function to display the current game state
def display_game_state(game_state)
  puts "\nGuesses left: #{game_state[:guesses_left]}"
  puts "Word: #{game_state[:display].join(' ')}"
  puts "Incorrect letters: #{game_state[:incorrect_letters].to_a.join(', ')}" unless game_state[:incorrect_letters].empty?
end

# Function to get player's input
def get_player_input
  loop do
    print "\nGuess a letter or type 'solve' to guess the whole word: "
    input = gets.chomp.downcase
    return input if input.length == 1 && input.match?(/[a-z]/) || input == 'solve'
    puts "Invalid input. Please enter a single letter or 'solve'."
  end
end

def get_player_word_guess
  loop do
    print "\nGuess the word: "
    input = gets.chomp.downcase
    return input if input.match?(/[a-z]/)
    puts "Invalid input."
  end
end

# Function to update the game state based on the player's guess
def update_game_state(game_state, guess)
  if guess == 'solve'
    word_guess = get_player_word_guess
    if word_guess == game_state[:secret_word]
      game_state[:display] = game_state[:secret_word].chars
    else
      puts "Incorrect guess."
      game_state[:guesses_left] -= 1
    end
  elsif game_state[:secret_word].include?(guess)
    game_state[:correct_letters].add(guess)
    game_state[:secret_word].chars.each_with_index do |char, index|
      game_state[:display][index] = char if char == guess
    end
  else
    game_state[:incorrect_letters].add(guess)
    game_state[:guesses_left] -= 1
  end
end

# Function to check if the game is over
def game_over?(game_state)
  game_state[:guesses_left] == 0 || game_state[:display].join == game_state[:secret_word]
end

# Function to display the game result
def display_game_result(game_state)
  if game_state[:display].join == game_state[:secret_word]
    puts "\nCongratulations! You won!"
  else
    puts "\nYou lost! The word was: #{game_state[:secret_word]}"
  end
end

# Main game loop
def play_hangman
  dictionary_url = 'https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt'
  dictionary_filename = 'google-10000-english-no-swears.txt'

  download_dictionary(dictionary_url, dictionary_filename)
  words = load_words(dictionary_filename)
  secret_word = choose_secret_word(words)
  game_state = initialize_game(secret_word)

  loop do
    display_game_state(game_state)
    guess = get_player_input()
    update_game_state(game_state, guess)
    break if game_over?(game_state)
  end

  display_game_result(game_state)
end

# Start the game
play_hangman



# Download the google-10000-english-no-swears.txt dictionary file from the first20hours GitHub repository google-10000-english.
# When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
# You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more
# incorrect guesses they have before the game ends. You should also display which correct letters have already been
# chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.
# Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to
# reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.
# Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option