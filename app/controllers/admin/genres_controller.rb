class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end
end