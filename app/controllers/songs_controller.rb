require 'httparty'
class SongsController < ApplicationController
  before_action :set_song, only:%i[show edit update destroy]
  def show; end

  def edit; end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:title, :artist_name, :genre, :release_year, :released))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song.update(song_params(:title,:artist_name))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(args)
  end

end
