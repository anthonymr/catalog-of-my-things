require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :publish_date

  def initialize(name, on_spotify)
    super(publish_date)
    @name = name
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
