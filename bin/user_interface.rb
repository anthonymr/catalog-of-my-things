require_relative 'app'

class UserInterface
  def initialize
    @selected_option = 0
    @app = App.new
  end

  def start
    until exit_option?
      print_menu
      ask_option
      evaluate_option
      continue
    end
  end

  private

  def continue
    puts 'Press enter to continue'
    gets.chomp
  end

  def print_menu
    system('cls') || system('clear')
    puts "Catalog of my things\n\n"
    puts '1  - List all books'
    puts '2  - List all music albums'
    puts '3  - List all movie'
    puts '4  - List all games'
    puts '5  - List all genres (e.g "Comedy", "Thriller")'
    puts '6  - List all labels (e.g. "Gift", "New")'
    puts '7  - List all authors (e.g. "Stephen King")'
    puts '8  - List all sources (e.g. "From a friend", "Online shop")'
    puts '9  - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - EXIT'
  end

  def ask_option
    puts "\nPlease select an option"
    @selected_option = gets.chomp.to_i
    system('cls') || system('clear')
    return if valid_option?

    puts 'Invalid option, try again'
    ask_option
  end

  def exit_option?
    @selected_option == 13
  end

  def valid_option?
    @selected_option.positive? && @selected_option <= 13
  end

  def evaluate_option
    case @selected_option
    when 1..4
      list_items
    when 5..8
      list_atributes
    when 9..12
      add_item
      puts "\nItem added successfully"
    when 13
      puts 'Bye!'
    end
  end

  def list_items
    case @selected_option
    when 1
      @app.list_books
    when 2
      @app.list_music_albums
    when 3
      puts 'Come back soon'
    when 4
      @app.list_games
    end
  end

  def list_atributes
    case @selected_option
    when 5
      puts @app.list_genres
    when 6
      puts @app.list_labels
    when 7
      puts @app.list_author
    when 8
      puts 'Come back soon'
    end
  end

  def add_item
    case @selected_option
    when 9
      add_book
    when 10
      add_music_album
    when 11
      puts 'Come back soon.'
    when 12
      add_game
    end
  end

  def add_book
    puts 'Please enter the publisher'
    publisher = gets.chomp
    puts 'Please enter the cover state'
    cover_state = gets.chomp
    puts 'Please enter the publish date'
    publish_date = gets.chomp
    @app.add_book(publisher, cover_state, publish_date)
  end

  def add_music_album
    puts 'Is the music album on spotify? (y/n)'
    on_spotify = gets.chomp == 'y'
    puts 'Please enter the publish date'
    publish_date = gets.chomp
    @app.add_music_album(on_spotify, publish_date)
  end

  def add_game
    puts 'Is the game multiplayer? (y/n)'
    multiplayer = gets.chomp == 'y'
    puts 'Please enter the last played date'
    last_played_at = gets.chomp
    puts 'Please enter the publish date'
    publish_date = gets.chomp
    @app.add_game(publish_date, multiplayer, last_played_at)
  end
end
