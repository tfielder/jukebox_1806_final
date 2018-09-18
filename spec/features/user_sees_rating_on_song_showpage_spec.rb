require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting song show page' do
    it 'shows numeric rating for song' do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, slug: "Superfreak", rating: 2)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)

      #visit song_path(@song_1)
      visit song_path(@song_1.slug)


      expect(page).to have_content ("Rating: #{@song_1.rating}")
    end
  end
end