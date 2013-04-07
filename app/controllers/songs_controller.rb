class SongsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    @song = current_user.songs.new(params[:song])
    if @song.save
      Contribution.create(:song_id => @song.id, :user_id => current_user.id)
      flash[:notice] = "Your song was successfully created! YAY!"
      redirect_to song_path(@song)
    else
      redirect_to :back
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

  def show
    @song = Song.find(params[:id])

  end

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
    @genres = Genre.all
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:notice] = "Your contact was successfully updated! WOO!"
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Your song was successfully deleted."
    redirect_to songs_path
  end

end
