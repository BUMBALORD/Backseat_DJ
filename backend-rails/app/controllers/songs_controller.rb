class SongsController < ApplicationController

  def upskip
    song = Song.where(id: params[:id]).first
    song.skip += 1
    song.save
    render json: {id: song.id, skip: song.skip}
  end

  def downskip
    song = Song.where(id: params[:id]).first
    song.skip -= 1
    song.save
    render json: {id: song.id, skip: song.skip}
  end

  def upreplay
    song = Song.where(id: params[:id]).first
    song.replay += 1
    song.save
    render json: {id: song.id, skip: song.replay}
  end

  def downreplay
    song = Song.where(id: params[:id]).first
    song.replay -= 1
    song.save
    render json: {id: song.id, skip: song.replay}
  end



end
