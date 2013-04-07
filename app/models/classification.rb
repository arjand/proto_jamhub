class Classification < ActiveRecord::Base

  # validates :user, :song, :presence => true
  attr_accessible :song_id, :genre_id
  belongs_to :genre
  belongs_to :song

end