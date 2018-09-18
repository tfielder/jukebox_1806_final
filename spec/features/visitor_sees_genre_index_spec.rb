require 'rails_helper'

describe 'as visitor' do
  describe 'vising genre index page' do
    it 'shows all genres' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
      @genre_1 = Genre.create(name: "Spooky")
      @genre_2 = Genre.create(name: "Fun")

      visit genres_path

      expect(page).to have_content("#{@genre_1.name}")
      expect(page).to have_content("#{@genre_2.name}")

    end
  end
end


# User Story 2:
#
# As a Visitor,
#   When I visit the genre index page,
#     I see all genres in the database.
#
# Testing requirements:
# - users should see at least 2 genres listed on the page