require_relative 'book'

class App
  def initialize
    @books = []
    @labels = []
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
  end

  def list_books
    @books.each { |book| puts book.to_s }
  end

  def list_labels
    @labels.map(&:title).join(', ')
  end
end
