require 'rspec'
require_relative '../bin/author'
require_relative '../bin/game'

describe Author do
  author = Author.new('Abdi', 'Raphael')
  describe '#initialize' do
    it 'should create a new Author' do
      expect(author).to be_a Author
    end

    it 'the new Author\'s first name should be Abdi' do
      expect(author.first_name).to eq('Abdi')
    end

    it 'the new Author\'s last name should be Raphael' do
      expect(author.last_name).to eq('Raphael')
    end
  end

  describe '#add_item' do
    it 'should add an item to the items array' do
      item = Game.new('2020-02-14', true, '2020-02-14')
      author.add_item(item)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include 'AError'
    end
  end
end
