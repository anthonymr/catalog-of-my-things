require 'time'

class Item
  attr_accessor :publish_date, :author
  attr_writer :label

  def initialize(publish_date)
    @publish_date = Time.parse(publish_date)

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

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    @publish_date < n_years_ago(10)
  end

  def n_years_ago(years)
    year = Time.now.year - years
    month = Time.now.month
    day = Time.now.day

    Time.new(year, month, day)
  end
end
