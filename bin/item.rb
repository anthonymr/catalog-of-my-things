class Item
  attr_accessor :published_date

  def initialize(_published_date)
    @publish_date = publised_date

    @id = rand(1000)
    @archived = false

    @genre = nil
    @author = nil
    @source = nil
    @label = nil
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end

  def add_source(source)
    @source = source
    source.add_item(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end
end
