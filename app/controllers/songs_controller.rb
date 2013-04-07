class SongsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy, :show, :index]

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    # @song = current_user.songs.create(params[:song])
    if @song = current_user.songs.create(params[:song])
      @song.contributions.first.update_attribute(:owner, true)
      # Contribution.create(:song_id => @song.id, :user_id => current_user.id, :owner => true)
      flash[:notice] = "Your song was successfully created! YAY!"
      redirect_to user_path(current_user)
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
    @tracks = current_user.tracks.all
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:notice] = "Your song was successfully updated!"
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def select_collaborator
    @song = Song.find(params[:id])
    @users = User.all
    render :select_collaborator
  end

  def add_collaborator
    p params
    @song = Song.find(params[:id])
    Contribution.create(:song_id => @song.id, :user_id => params[:user_id], :owner => false)
    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Your song was successfully deleted."
    redirect_to user_path(current_user)
  end

end
