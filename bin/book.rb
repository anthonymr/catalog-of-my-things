require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_s
    "(#{@id}) publisher: #{@publisher} - cover state: #{@cover_state} - publish date: #{@publish_date.to_date}"
  end

  private :can_be_archived?
end
