class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @title = title
    @color = color

    @id = rand(1000)
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
