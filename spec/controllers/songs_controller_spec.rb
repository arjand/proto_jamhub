require 'spec_helper'

describe SongsController do
  

  context 'routing' do
    it {should route(:get, '/songs/new').to :action => :new}
    it {should route(:post, '/songs').to :action => :create}
    it {should route(:get, '/songs/1').to :action => :show, :id => 1}
    it {should route(:get, '/songs/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/songs/1').to :action => :update, :id => 1}
    it {should route(:delete, '/songs/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/songs').to :action => :index}
  end

  let(:song) {FactoryGirl.create :song}
  let(:user) {FactoryGirl.create :user}
  let(:valid_attributes) {{ :title => 'song of greatness'}}
  let(:valid_parameters) {{:song => valid_attributes, :id => song.id}}
  let(:invalid_attributes) {{:title => ''}}
  let(:invalid_parameters) {{:song => invalid_attributes, :id => song.id}}

  context 'GET new' do
    before {get :new, {}, {'user_id' => user.id}}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid parameters' do
      it 'creates a new song' do
        expect {post :create, valid_parameters, {'user_id' => user.id}}.to change(Song, :count).by(1)
      end

      before {post :create, valid_parameters, {'user_id' => user.id}}
      it {should redirect_to song_path(Song.last)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before do
        request.env["HTTP_REFERER"] = "where_i_came_from"
        post :create, invalid_parameters, {'user_id' => user.id}
      end
      it {should redirect_to "where_i_came_from"}
    end
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end

  context 'GET edit' do
    context 'with authorized session' do
      before {get :edit, {:id => song.id}, {'user_id' => user.id}}
      it {should render_template :edit}
    end

    context 'without authorized session' do
      before {get :edit, {:id => song.id}, {}}
      it {should redirect_to login_path}
      it {should set_the_flash[:alert]}
    end
  end

  context 'PUT update' do
    context 'with valid parameters' do
      before {put :update, valid_parameters, {'user_id' => user.id}}

      it 'updates the song' do
        Song.find(song.id).title.should eq valid_attributes[:title]
      end

      it {should redirect_to song_path(song)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before {put :update, invalid_parameters, {'user_id' => user.id}}

      it {should render_template :edit}
    end
  end

  context 'GET show' do
    before {get :show, {:id => song.id}}

    it {should render_template :show}
  end

  context 'DELETE destroy' do
    it 'destroys a song' do
      factory_song = FactoryGirl.create :song 
      expect {delete :destroy, {:id => factory_song.id}, {'user_id' => user.id}}.to change(Song, :count).by(-1)
    end

    before {delete :destroy, {:id => song.id}, {'user_id' => user.id}}

    it {should redirect_to songs_path}
    it {should set_the_flash[:notice]}
  end
end