require_relative 'music_album'

class App
  def initialize
    @music_albums = []
    @genres = []
  end

  def add_music_album(on_spotify, publish_date)
    music_album = MusicAlbum.new(on_spotify, publish_date)
    @music_albums << music_album
  end

  def list_music_albums
    @music_albums.each { |music_album| puts music_album }
  end

  def list_genres
    @genre.map(&:name).join(', ')
  end
end
