require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "(#{@id}) on spotify: #{@on_spotify} - publish date: #{@publish_date.to_date}"
  end
end
