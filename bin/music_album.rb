require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :name
  attr_reader :publish_date

  def initialize(name, on_spotify,publish_date)
    super(publish_date)
    @name = name
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "(#{@id}) name: #{@name} - on spotify: #{@on_spotify} - publish date: #{@publish_date.to_date}"
  end
end
