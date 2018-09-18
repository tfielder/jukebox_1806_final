class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create!(song_params)
    redirect_to song_path(@song.slug)
  end

  def show
    @song = Song.find_by(slug: params[:slug])
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :play_count, :slug)
  end


end
