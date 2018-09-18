class Genre < ApplicationRecord
  has_many :song_genres
  has_many :songs, through: :song_genres

  validates_presence_of :name

  def avg_rating
    Genre.songs.average(:rating)
  end
end