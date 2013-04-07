class TracksController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy, :show, :index]

  # GET /tracks
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  def show
    @track = Track.find(params[:id])
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
  end

  # POST /tracks
  def create
    @track = Track.new(params[:track])
    if @track.save
#      Contribution.create(:track_id => @song.id, :user_id => current_user.id)
      flash[:notice] = "Your track was successfully created."
      redirect_to track_path(@track)
    else
      redirect_to :back
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end  
  end

  # PUT /tracks/1
  def update
    @track = Track.find(params[:id])
    # Compilation.create(:song_id => @song.id, :user_id => current_user.id)
    if @track.update_attributes(params[:track])
      flash[:notice] = "Your track was successfully updated."
      redirect_to track_path(@track)
    else
      render :edit
    end
  end

  # DELETE /tracks/1
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:notice] = "Your track was successfully deleted."
    redirect_to tracks_path
  end
end
