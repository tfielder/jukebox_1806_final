require 'rails_helper'

describe 'as a visitor' do
  describe 'on genre index page' do
    it 'doesnt show creation form for genre' do
      visit genres_path

      expect(page).to have_content("#{@genre_1.name}")
      expect(page).to have_content("#{@genre_2.name}")

      expect(page).to_not have_content("Create a Genre")
      expect(page).to_not have_content("Submit")
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