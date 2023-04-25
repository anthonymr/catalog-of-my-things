require 'rspec'
require_relative '../bin/item'
require_relative '../bin/game'

describe Game do
  before :each do
    @game = Game.new('2012-01-15', false, '2020-02-14')
  end

  it 'Inherits from Item class' do
    expect(Game < Item).to eq true
  end

  it 'has the correct instantiation' do
    expect(@game.multiplayer).to eq false
    expect(@game.last_played_at).to eq Time.parse('2020-02-14')
  end

  describe '#can_be_archived' do
    it 'returns true' do
      expect(@game.send(:can_be_archived?)).to be_truthy
    end
  end
end
