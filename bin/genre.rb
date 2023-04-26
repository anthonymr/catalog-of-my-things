class Genre
  attr_accessor :name

  def self.from_hash(data)
    new(data['name'], data['id'])
  end

  def initialize(name, id = nil)
    @id = id || rand(1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end

  def compare_to?(id)
    @id == id
  end
end
