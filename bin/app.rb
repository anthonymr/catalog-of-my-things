require_relative 'music_album'

class App
  def initialize
    @music_album = []
    @genres = []
  end

  def add_music_album(name, on_spotify, publish_date)
    music_album = MusicAlbum.new(name, on_spotify, publish_date)
    @music_album << music_album
  end

  def list_music_albums
    @music_album.each { |music_album| puts music_album }
  end

  def list_genres
    @genre.map(&:name).join(', ')
  end
end