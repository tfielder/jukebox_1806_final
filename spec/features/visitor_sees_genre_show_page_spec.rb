require 'rails_helper'

describe 'as visitor' do
  describe 'visiting genre show page' do
    before(:each) do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")

      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2, slug: 'Superfreak')
      @song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000, rating: 4)
      @song_3 = artist_2.songs.create(title: 'Cubes', length: 200, play_count: 10000, rating: 5)

      @genre_1 = Genre.create(name: "Spooky")
      @genre_2 = Genre.create(name: "Fun")
      @genre_3 = Genre.create(name: "Cool")

      @song_1.genres << @genre_1
      @song_1.genres << @genre_2
      @song_2.genres << @genre_1


    end
     it "show genre names under a heading that says Genres for this Song:
      and the genres listed are only the genres associated with this song." do
        visit genre_path(@genre_1)

        expect(page).to have_content("Songs with this Genre:")

        expect(page).to have_content("#{@song_1.title}")
        expect(page).to have_content("#{@song_2.title}")
        expect(page).to_not have_content("#{@song_3.title}")
      end
      it 'shows average rating for all songs with that genre' do
        visit genre_path(@genre_1)

        expect(page).to have_content("Average Rating for Songs with This Genre: #{@genre_1.avg_rating}")

      end
  end
end

# User Story 6:
#
# As a Visitor,
#   When I visit a genre show page,
#     I see all songs associated with that genre listed on the page.
#
# Testing requirements:
# - I should see at least 2 songs listed for a genre
# - Also include 1 or more songs that are NOT associated with this genre and ensure
#   they do not appear on the page