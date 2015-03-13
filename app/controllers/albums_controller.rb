class AlbumsController < ApplicationController

  def new
    @bands = Band.all
    @album = Album.new
    @band_id = params[:band_id]
    render :new
  end

  def create
    @bands = Band.all
    @band_id = params[:band_id]
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

private

  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end

end
