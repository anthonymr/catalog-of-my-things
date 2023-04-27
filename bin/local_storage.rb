require 'json'

class LocalStorage
  class << self
    attr_accessor :books_file, :music_albums_file, :games_file, :labels_file, :authors_file, :genres_file

    def save_data(app)
      save_to_file(books_file, array_to_hash(app.books))
      save_to_file(labels_file, array_to_hash(app.labels))
      save_to_file(games_file, array_to_hash(app.games))
      save_to_file(authors_file, array_to_hash(app.authors))
      save_to_file(music_albums_file, array_to_hash(app.music_albums))
      save_to_file(genres_file, array_to_hash(app.genres))
    end

    def load_data(app)
      app.labels = load_from_file(labels_file).map { |label| Label.from_hash(label) }
      app.authors = load_from_file(authors_file).map { |author| Author.from_hash(author) }
      app.genres = load_from_file(genres_file).map { |genre| Genre.from_hash(genre) }

      load_from_file(books_file).map do |book|
        new_book = Book.from_hash(book)
        new_label = app.labels.find { |label| label.compare_to?(book['label_id']) }
        new_book.add_label(new_label) if new_label
        app.books << new_book
      end

      load_from_file(games_file).map do |game|
        new_game = Game.from_hash(game)
        new_author = app.authors.find { |author| author.compare_to?(game['author_id']) }
        new_game.add_author(new_author) if new_author
        app.games << new_game
      end

      load_from_file(music_albums_file).map do |album|
        new_album = MusicAlbum.from_hash(album)
        new_genres = app.genres.find { |genre| genre.compare_to?(album['genre_id']) }
        new_album.add_genre(new_genres) if new_genres
        app.music_albums << new_album
      end
    end

    def save_to_file(filename, data)
      File.write(filename, JSON.generate(data))
    end

    def load_from_file(filename)
      return [] if filename.nil? || filename.empty? || !File.exist?(filename)

      JSON.parse(File.read(filename))
    rescue JSON::ParserError
      []
    end

    def array_to_hash(array)
      array.map(&:to_hash)
    end
  end
end
