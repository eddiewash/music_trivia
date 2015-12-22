class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def new
    @song = Song.new
  end

  def create
    if Song.where(artist: params[:q].capitalize).empty?
      json = JSON.parse(HTTParty.get "https://itunes.apple.com/search?term=#{params[:q]}&limit=5")
      json["results"].each do |song|
        @song = Song.new
        @song.artist = song["artistName"]
        @song.track_name = song["trackName"]
        @song.preview = song["previewUrl"]
        @song.art_work = song["artworkUrl100"]
        @song.genre = song["primaryGenreName"]
        @song.save
      end
    end
    redirect_to root_path
  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render 'edit'
    end
  end

  private

  # def song_params
  #   params.require(:song).permit :artist, :track_name, :preview, :art_work, :genre
  # end

  def get_song
    Song.find params[:id]
  end
end
