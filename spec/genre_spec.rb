require_relative '../bin/genre'

describe Genre do
  context 'when initialized' do
    let(:genre) { Genre.new('R and B') }

    it 'has name a name' do
      expect(genre.name).to eq('R and B')
    end
  end

  context 'when adding an item' do
    let(:genre) { Genre.new('R and B') }
    let(:item) { Item.new('20-11-2021') }

    it 'adds the item to its items list' do
      genre.add_item(item)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include 'AError'
    end
  end
end
