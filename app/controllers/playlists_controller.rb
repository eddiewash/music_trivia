class PlaylistsController < ApplicationController

  def show
    @playlist = Playlist.first
    @songs = @playlist.songs.order(:last_played).reverse
  end

end
