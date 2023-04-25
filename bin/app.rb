require_relative 'music_album'
require_relative 'book'
require_relative 'game'
require_relative 'author'

class App
  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
    @games = []
    @authors = []
  end

  def add_music_album(on_spotify, publish_date)
    music_album = MusicAlbum.new(on_spotify, publish_date)
    @music_albums << music_album
  end

  def list_music_albums
    @music_albums.each { |music_album| puts music_album }
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

  def list_genres
    @genre.map(&:name).join(', ')
  end
end
