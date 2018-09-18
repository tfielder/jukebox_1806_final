require 'rails_helper'

describe 'as visitor' do
  describe 'visiting song show page' do
    before(:each) do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2, slug: 'Superfreak')
      @song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
      @song_3 = artist_2.songs.create(title: 'Cubes', length: 200, play_count: 10000)

      @genre_1 = Genre.create(name: "Spooky")
      @genre_2 = Genre.create(name: "Fun")
      @genre_3 = Genre.create(name: "Cool")

      @song_1.genres << @genre_1
      @song_1.genres << @genre_2
      @song_2.genres << @genre_1


    end
     it "show genre names under a heading that says Genres for this Song:
      and the genres listed are only the genres associated with this song." do
        visit song_path(@song_1)

        expect(page).to have_content("Genres for this Song:")

        expect(page).to have_content("#{@genre_1.name}")
        expect(page).to have_content("#{@genre_2.name}")
        expect(page).to_not have_content("#{@genre_3.name}")
      end
  end
end