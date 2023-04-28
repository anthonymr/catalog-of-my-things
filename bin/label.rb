class Label
  attr_accessor :title, :color

  def self.from_hash(data)
    new(data['title'], data['color'], data['id'])
  end

  def initialize(title, color, id = nil)
    @title = title
    @color = color

    @id = id || rand(1000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def compare_to?(id)
    @id == id
  end
end
