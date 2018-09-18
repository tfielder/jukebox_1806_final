require "rails_helper"

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:song_genres)}
    it {should have_many(:songs).through(:song_genres)}
  end
  describe 'class method' do
    it '#avg_rating' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2, slug: 'Superfreak')
      @song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 4)
      @song_3 = artist_2.songs.create(title: 'Cubes', length: 200, play_count: 10000, rating: 5)

      @genre_1 = Genre.create(name: "Spooky")
      @genre_2 = Genre.create(name: "Fun")

      @song_1.genres << @genre_1
      @song_2.genres << @genre_1

      expect("#{@genre_1.avg_rating}").to eq(3)
    end
  end
end