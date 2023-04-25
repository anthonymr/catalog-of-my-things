require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "(#{@id}) on spotify: #{@on_spotify} - publish date: #{@publish_date.to_date}"
  end
end
