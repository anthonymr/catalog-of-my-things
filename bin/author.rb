class Author
  attr_accessor :first_name, :last_name

  def self.from_hash(data)
    new(data['first_name'], data['last_name'], data['id'])
  end

  def initialize(first_name, last_name, id = nil)
    super(id)
    @id = id || Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      author_id: @author&.id
    }
  end
end
