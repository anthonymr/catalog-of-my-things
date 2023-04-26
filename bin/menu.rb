class Menu
  class << self
    attr_accessor :selected_option

    def print_menu
      system('cls') || system('clear')
      puts '1  - List elements (books, games, music albums, movies)'
      puts '2  - List attributes (genres, labels, authors, sources)'
      puts '3  - Add elements (books, games, music albums, movies)'
      puts '4  - Add attributes (genres, labels, authors, sources)'
      puts '5  - Add attributes to elements (genres to music albums, labels to books, etc.)'
      puts '6  - Remove elements (books, games, music albums, movies)'
      puts '7  - EXIT'

      ask_option(7)
    end

    def sub_menu1
      system('cls') || system('clear')
      puts '1  - List all books'
      puts '2  - List all music albums'
      puts '3  - List all movie'
      puts '4  - List all games'
      puts '5  - EXIT'

      ask_option(5)
    end

    def sub_menu2
      system('cls') || system('clear')
      puts '1  - List all genres (e.g "Comedy", "Thriller")'
      puts '2  - List all labels (e.g. "Gift", "New")'
      puts '3  - List all authors (e.g. "Stephen King")'
      puts '4  - List all sources (e.g. "From a friend", "Online shop")'
      puts '5  - EXIT'

      ask_option(5)
    end

    def sub_menu3
      system('cls') || system('clear')
      puts '1  - Add a book'
      puts '2  - Add a music album'
      puts '3  - Add a movie'
      puts '4  - Add a game'
      puts '5  - EXIT'

      ask_option(5)
    end

    def sub_menu4
      system('cls') || system('clear')
      puts '1  - Create a genre'
      puts '2  - Create a label'
      puts '3  - Create an author'
      puts '4  - Create a source'
      puts '5  - EXIT'

      ask_option(5)
    end

    def sub_menu5
      system('cls') || system('clear')
      puts '1  - Add label to book'
      puts '2  - Add genre to music album'
      puts '3  - Add source to movie'
      puts '4  - Add author to game'
      puts '5  - EXIT'

      ask_option(5)
    end

    def sub_menu6
      system('cls') || system('clear')
      puts '1  - Remove a book'
      puts '2  - Remove a music album'
      puts '3  - Remove a movie'
      puts '4  - Remove a game'
      puts '5  - EXIT'

      ask_option(5)
    end

    private

    def ask_option(max)
      puts "\nPlease select an option"
      selected_option = gets.chomp.to_i
      system('cls') || system('clear')
      return selected_option if valid_option?(selected_option, max)

      puts 'Invalid option, try again'
      ask_option(7)
    end

    def valid_option?(option, max)
      option.between?(1, max)
    end

    def exit_option?
      selected_option == 7
    end
  end
end
