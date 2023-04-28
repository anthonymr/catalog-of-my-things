require_relative '../bin/label'

describe Label do
  context 'when initialized' do
    let(:label) { Label.new('label', 'red') }

    it 'has a title' do
      expect(label.title).to eq('label')
    end

    it 'has a color' do
      expect(label.color).to eq('red')
    end
  end

  context 'When added to an item' do
    let(:label) { Label.new('label', 'red') }
    let(:item) { Item.new('2010-01-01') }

    it 'has an item' do
      label.add_item(item)
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include 'AError'
    end
  end
end
