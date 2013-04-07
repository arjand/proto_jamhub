class Compilation < ActiveRecord::Base

  validates :track_id, :song_id, :presence => true
  attr_accessible :track_id, :song_id
  belongs_to :track
  belongs_to :song

end