class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(artist_name: params[:song][:artist_name], genre: params[:song][:genre], release_year: params[:song][:release_year], released: params[:song][:released], title: params[:song][:title])
    
        if @song.valid? 
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @new_song = Song.new(artist_name: params[:song][:artist_name], genre: params[:song][:genre], release_year: params[:song][:release_year], released: params[:song][:released], title: params[:song][:title])    
        if @new_song.valid?
            @song.update(artist_name: params[:song][:artist_name], genre: params[:song][:genre], release_year: params[:song][:release_year], released: params[:song][:released], title: params[:song][:title])
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private

    def song_params
        params.permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def set_song!
        @song = Song.find(params[:id])
    end
end
