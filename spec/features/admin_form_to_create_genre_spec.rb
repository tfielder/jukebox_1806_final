require 'rails_helper'

describe 'as an admin' do
  describe 'vising genre index page' do
    before(:each) do
      artist_1 = Artist.create(name: "Rick James")
      artist_2 = Artist.create(name: "Vanilla Ice")
      @song_1 = artist_1.songs.create(title: 'Superfreak', length: 300, play_count: 5000000, rating: 2)
      song_2 = artist_2.songs.create(title: 'Ice Ice Baby', length: 200, play_count: 10000)
      @genre_1 = Genre.create(name: "Spooky")
      @genre_2 = Genre.create(name: "Fun")

      @admin = User.create(username: "Ian", password: "test123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    end
    it 'shows all genres and form to create a new genre' do

      visit genres_path

      expect(page).to have_content("#{@genre_1.name}")
      expect(page).to have_content("#{@genre_2.name}")

      expect(page).to have_content("Create a Genre")

    end
    it 'allows admin to fill out form and see new genre' do
      visit genres_path

      fill_in "Name", with: "name1"

      click_on "Create Genre"

      visit genres_path

      expect(page).to have_content("#{@genre_1.name}")
      expect(page).to have_content("#{@genre_2.name}")
      expect(page).to have_content("name1")
    end

  end
end
# User Story 3:
#
# As an admin user,
#   When I visit the same genre index page that visitors see,
#   I see the same information visitors see,
#     And I also see a form to create a new genre.
#
# Testing requirements:
# - users should see at least 2 genres listed on the page
#
# Note: admins will not have a separate page for the form, the form should be on the index page