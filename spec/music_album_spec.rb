require_relative '../classes/music_album'

describe 'MusicAlbum' do
  before(:each) do
    @musicalbum = MusicAlbum.new(true, 'Fav', '02/15/1999')
  end

  it 'can has an instance' do
    expect(@musicalbum).to be_an_instance_of MusicAlbum
  end

  it 'has on_spotify to be true' do
    expect(@musicalbum.on_spotify).to be true
  end

  it 'has name to be Fav' do
    expect(@musicalbum.name).to eq 'Fav'
  end

  it 'has publish_date to be 02/15/1999' do
    expect(@musicalbum.publish_date).to eq '02/15/1999'
  end
end
