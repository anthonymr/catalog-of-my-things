require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def self.from_hash(data)
    new(data['publish_date'], data['multiplayer'], data['last_played_at'], data['id'])
  end

  def initialize(publish_date, multiplayer, last_played_at, id = nil)
    super(publish_date, id)

    @multiplayer = multiplayer
    @last_played_at = Time.parse(last_played_at)
  end

  def to_s
    game = "Game: (#{@id}) - multiplayer: #{@multiplayer}"
    date = "publish date: #{@publish_date.to_date} - last payed at: #{@last_played_at.to_date}"
    [game, date].join(' - ')
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      game_id: @game&.id
    }
  end

  private

  def can_be_archived?
    super && @last_played_at < n_years_ago(2)
  end
end
