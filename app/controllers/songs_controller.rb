class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs.as_json
  end

  def create
    song = Song.new(
      title: "Billie Jean",
      album: "Thriller",
      artist: "Michael Jackson",
      year: 1983,
    )
    song.save
    render json: song.as_json
  end

  def show
    song = Song.find_by(id: parmas["id"])
    render json: song.as_json
  end

  def update
    song = Song.find_by(id: params[:id])
    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.save
    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id: params["id"])
    song.destroy
    render json: { message: "Song successfully destroyed!" }
  end
end
