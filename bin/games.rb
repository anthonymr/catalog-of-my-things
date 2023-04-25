require_relative 'item'

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    attr_reader :id

    def initialize(id, publish_date, archived, multiplayer, last_played_at)
        super(id, publish_date, archived: archived)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private

    def can_be_archived?
        today_date = Date.today.strftime('%Y-%m-%d')
        parsed = Date.parse(today_date)
        last_played_date = Date.parse(@last_played_at)

        difference_in_years = (parse.year - last_played_date.year).to_i

        super && (difference_in_years > 2)
    end

    def can_be_archived?
        today_date = Date.today.strftime('%Y-%m-%d')    
        parsed = Date.parse(today_date)    
        last_played_date = Date.parse(@last_played_at)    
        difference_in_years = (parsed.year - last_played_date.year).to_i
        super && (difference_in_years > 2)
      end
end