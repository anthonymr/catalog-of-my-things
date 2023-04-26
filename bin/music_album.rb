require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def self.from_hash(data)
    new(data['on_spotify'], data['publish_date'], data['id'])
  end

  def initialize(on_spotify, publish_date, id = nil)
    super(publish_date, id)
    @on_spotify = on_spotify
  end

  def to_s
    "(#{@id}) on spotify: #{@on_spotify} - publish date: #{@publish_date.to_date}"
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      on_spotify: @on_spotify,
      genre_id: @genre&.id
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
