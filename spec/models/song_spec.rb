require 'rails_helper'

describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlist_songs)}
    it {should have_many(:playlists).through(:playlist_songs)}
  end
  describe 'has a rating' do
    it 'has a rating by default' do
    artist = Artist.create(name: "Prince")
    song = artist.songs.create(title: "Purple Rain", length: 209, play_count: 3445)

    expect(song.rating).to eq(0)
    end
  end
  describe 'it has a slug' do
    it 'has a slug' do
      artist = Artist.create(name: "Prince")
      song = artist.songs.create(title: "Heyya", length: 209, play_count: 3445)

      expect(song.slug).to eq("heyya")
    end
  end
end
