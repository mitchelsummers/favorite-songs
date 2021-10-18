class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs.as_json
  end
  def create
    song = Song.new(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"]
    )
    song.save
    render json: song.as_json
  end
  def show
    id = params["id"]
    song = Song.find_by[id: "id"]
    render json: song.as_json
  end
  def update
    id = params["id"]
    song = Song.find_by[id: "id"]
    song.title = params["title"] || song.title
    song.album = params["album"] || song.album
    song.artist = params["artist"] || song.artist
    song.year = params["year"] || song.year
    render json: song.as_json
  end
  def destroy
    id = params["id"]
    song = Song.find_by[id: "id"]
    song.destroy
    render json: {message: "Song deleted."}
  end
end
