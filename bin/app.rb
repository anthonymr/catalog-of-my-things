require_relative 'book'
require_relative 'game'
require_relative 'author'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_labels
    @labels.map(&:title).join(', ')
  end

  def add_game(multiplayer, last_played_at, publish_date)
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
  end

  def list_games
    @games.each { |game| puts game }
  end

  def list_author
    @authors.map(&:first_name).join(', ')
  end
end
