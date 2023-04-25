require_relative '../bin/music_album'
require_relative '../bin/genre'

describe MusicAlbum do
  context 'When initialized' do
    let(:album) { MusicAlbum.new(true, '2010-11-11') }

    it 'it is on spotify' do
      expect(album.on_spotify).to eq(true)
    end

    it 'has a publish date' do
      expect(album.publish_date).to eq(Time.parse('2010-11-11'))
    end
  end

  context 'After 10 years' do
    let(:album) { MusicAlbum.new(true, '2009-11-11') }

    it 'can archived' do
      expect(album.send(:can_be_archived?)).to eq(true)
    end
  end

  context 'When is not on spotify' do
    let(:album) { MusicAlbum.new(false, '2009-11-11') }

    it 'can not be archived' do
      expect(album.send(:can_be_archived?)).to eq(false)
    end
  end
end
