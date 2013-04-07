class Track < ActiveRecord::Base
  attr_accessible :description, :tag, :title, :user_id
  validates :title, :presence => true

  has_many :compilations
  has_many :songs, :through => :compilations
  belongs_to :user

end
