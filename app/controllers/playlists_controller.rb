class PlaylistsController < ApplicationController

  def show
    @playlist = Playlist.first
  end

end
