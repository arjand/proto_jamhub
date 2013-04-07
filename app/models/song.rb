class Song < ActiveRecord::Base

  validates :title, :presence => true
  #validates :genre_id, :presence => true

  attr_accessible :title, :description

  has_many :compilations
  has_many :tracks, :through => :compilations

  has_many :contributions
  has_many :users, :through => :contributions

  has_many :classifications
  has_many :genres, :through => :classifications
  
end