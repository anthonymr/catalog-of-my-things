require_relative 'music_album'
require_relative 'book'
require_relative 'game'
require_relative 'author'

class App
  def initialize
    @music_albums = []
    @games = []
    @books = []

    @labels = []
    @authors = []
    @genres = []
  end

  def add_music_album(on_spotify, publish_date)
    music_album = MusicAlbum.new(on_spotify, publish_date)
    @music_albums << music_album
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
  end

  def add_game(publish_date, multiplayer, last_played_at)
    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game
  end

  def list_music_albums
    return 'Music album list is empty' if @music_albums.empty?

    @music_albums.each { |music_album| puts music_album }
  end

  def list_books
    return 'Book list is empty' if @books.empty?

    @books.each { |book| puts book }
  end

  def list_games
    return 'Game list is empty' if @games.empty?

    @games.each { |game| puts game }
  end

  def list_labels
    return 'Label list is empty' if @labels.empty?

    @labels.map(&:title).join(', ')
  end

  def list_author
    return 'Author list is empty' if @authors.empty?

    @authors.map(&:first_name).join(', ')
  end

  def list_genres
    return 'Genres list is empty' if @genres.empty?

    @genres.map(&:name).join(', ')
  end
end
