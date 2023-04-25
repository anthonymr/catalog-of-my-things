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
    end
  end

  private

  def print_menu
    puts 'Please choose an options'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movie'
    puts '4 - List all games'
    puts '5 - List all genres (e.g "Comedy", "Thriller")'
    puts '6 - List all labels (e.g. "Gift", "New")'
    puts '7 - List all authors (e.g. "Stephen King")'
    puts '8 - List all sources (e.g. "From a friend", "Online shop")'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13- EXIT'
  end

  def ask_option
    puts 'Please select an option'
    @selected_option = gets.chomp.to_i
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
    end
  end

  def list_items
    case @selected_option
    when 1
      @app.list_books
    when 2
      puts 'option 2'
    when 3
      puts 'option 3'
    when 4
      puts 'option 4'
    end
  end

  def list_atributes
    case @selected_option
    when 5
      puts 'option 5'
    when 6
      @app.list_labels
    when 7
      puts 'option 7'
    when 8
      puts 'option 8'
    end
  end

  def add_item
    case @selected_option
    when 9
      puts 'Please enter the publisher'
      publisher = gets.chomp
      puts 'Please enter the cover state'
      cover_state = gets.chomp
      puts 'Please enter the publish date'
      publish_date = gets.chomp
      @app.add_book(publisher, cover_state, publish_date)
    when 10
      puts 'option 10'
    when 11
      puts 'option 11'
    when 12
      puts 'option 12'
    end
  end
end
