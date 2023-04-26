require_relative 'app'
require_relative 'local_storage'
require_relative 'menu'

class UserInterface
  def initialize
    @selected_option = 0
    @app = App.new

    LocalStorage.books_file = File.join(__dir__, 'data', 'books.json')
    LocalStorage.labels_file = File.join(__dir__, 'data', 'labels.json')
    LocalStorage.music_albums_file = File.join(__dir__, 'data', 'music_albums.json')
    LocalStorage.genres_file = File.join(__dir__, 'data', 'genres.json')
  end

  def start
    LocalStorage.load_data(@app)

    until @selected_option == 7
      @selected_option = Menu.print_menu
      evaluate_main_menu_option
      pause_execution
    end
  end

  private

  def evaluate_main_menu_option
    list_items if @selected_option == 1
    list_atributes if @selected_option == 2
    add_item if @selected_option == 3
    create_attribute if @selected_option == 4
    add_attribute if @selected_option == 5
    remove_item if @selected_option == 6
    puts 'Bye bye!' if @selected_option == 7
  end

  def list_items
    @selected_option = Menu.sub_menu1
    @app.list_books if @selected_option == 1
    @app.list_music_albums if @selected_option == 2
    puts 'Come back soon' if @selected_option == 3
    @app.list_games if @selected_option == 4
    @selected_option = 7 if @selected_option == 5
  end

  def list_atributes
    @selected_option = Menu.sub_menu2
    puts @app.list_genres if @selected_option == 1
    puts @app.list_labels if @selected_option == 2
    puts @app.list_author if @selected_option == 3
    puts 'Come back soon' if @selected_option == 4
    @selected_option = 7 if @selected_option == 5
  end

  def add_item
    @selected_option = Menu.sub_menu3
    add_book if @selected_option == 1
    add_music_album if @selected_option == 2
    puts 'Come back soon' if @selected_option == 3
    add_game if @selected_option == 4
    @selected_option = 7 if @selected_option == 5
  end

  def create_attribute
    @selected_option = Menu.sub_menu4
    case @selected_option
    when 2
      label_title = get_input('Please enter the label title')
      label_color = get_input('Please enter the label color')

      @app.create_label(label_title, label_color)
    when 1, 3..4
      puts 'Come back soon.'
    when 5
      puts 'Bye bye!'
      @selected_option = 7
    end
  end

  def add_attribute
    @selected_option = Menu.sub_menu5
    case @selected_option
    when 1
      add_book_attribute
    when 2..4
      puts 'Come back soon.'
    when 5
      puts 'Bye bye!'
      @selected_option = 7
    end
  end

  def remove_item
    @selected_option = Menu.sub_menu6
    case @selected_option
    when 1
      remove_book
    when 2..4
      puts 'Come back soon.'
    when 5
      puts 'Bye bye!'
      @selected_option = 7
    end
  end

  def add_book
    publisher = get_input('Please enter the publisher')
    cover_state = get_input('Please enter the cover state')
    publish_date = get_input('Please enter the publish date')
    @app.add_book(publisher, cover_state, publish_date)
  end

  def add_music_album
    on_spotify = get_input('Is the music album on spotify? (y/n)') == 'y'
    publish_date = get_input('Please enter the publish date')
    @app.add_music_album(on_spotify, publish_date)
  end

  def add_game
    multiplayer = get_input('Is the game multiplayer? (y/n)') == 'y'
    last_played_at = get_input('Please enter the last played date')
    publish_date = get_input('Please enter the publish date')
    @app.add_game(publish_date, multiplayer, last_played_at)
  end

  def add_book_attribute
    @app.list_books
    book_id = get_input('Please enter the book id').to_i
    puts @app.list_labels

    label_id = get_input('Please enter the label id').to_i
    @app.add_book_label(book_id, label_id)

    puts 'Label added successfully'
  end

  def remove_book
    @app.list_books
    id = get_input('Please enter the book id').to_i
    @app.remove_book(id)
    puts 'Book removed successfully'
  end

  def pause_execution
    get_input('Press enter to continue')
  end

  def get_input(message)
    puts message
    gets.chomp
  end
end
