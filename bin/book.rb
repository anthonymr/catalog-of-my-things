require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def self.from_hash(data)
    new(data['publisher'], data['cover_state'], data['publish_date'], data['id'])
  end

  def initialize(publisher, cover_state, publish_date, id = nil)
    super(publish_date, id)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_s
    "(#{@id}) publisher: #{@publisher} - cover state: #{@cover_state} - publish date: #{@publish_date.to_date}"
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state,
      label_id: @label&.id
    }
  end

  private :can_be_archived?
end
