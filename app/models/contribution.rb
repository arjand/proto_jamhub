class Contribution < ActiveRecord::Base

  # validates :user, :song, :presence => true
  attr_accessible :user_id, :song_id, :owner
  belongs_to :user
  belongs_to :song

end