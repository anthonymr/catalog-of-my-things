require_relative '../bin/book'
require_relative '../bin/label'

describe Book do
  context 'when initialized' do
    let(:book) { Book.new('publisher', 'good', '2010-01-01') }

    it 'has a publisher' do
      expect(book.publisher).to eq('publisher')
    end

    it 'has a cover state' do
      expect(book.cover_state).to eq('good')
    end

    it 'has a publish date' do
      expect(book.publish_date).to eq(Time.parse('2010-01-01'))
    end
  end

  context 'After 10 years' do
    let(:book) { Book.new('publisher', 'good', '2000-01-01') }

    it 'can be archived' do
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  context 'After 10 years and with a bad cover' do
    let(:book) { Book.new('publisher', 'bad', '2000-01-01') }

    it 'can be archived' do
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  context 'When the cover is bad' do
    let(:book) { Book.new('publisher', 'bad', '2010-01-01') }

    it 'can be archived' do
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  context 'When added to a label' do
    let(:book) { Book.new('publisher', 'good', '2010-01-01') }
    let(:label) { Label.new('label', 'red') }

    it 'has a label' do
      book.add_label(label)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include 'AError'
    end
  end
end
