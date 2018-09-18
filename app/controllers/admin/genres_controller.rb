class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end