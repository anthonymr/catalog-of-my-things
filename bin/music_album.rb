require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :publish_date

  def initialize(on_spotify)
    super(publish_date)
    @name = name
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
