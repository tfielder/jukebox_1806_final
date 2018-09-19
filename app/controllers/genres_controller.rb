class GenresController < ApplicationController

  def index
    @genre = Genre.new
    if current_user && current_user.admin?
      @admin = current_user
    end
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

end