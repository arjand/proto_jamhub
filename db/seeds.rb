# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {email: 'a@b.c', jam_name: '111', password: 'abc123', password_confirmation: 'abc123'},
  {email: 'b@c.d', jam_name: '222', password: 'abc123', password_confirmation: 'abc123'},
  {email: 'd@e.f', jam_name: '333', password: 'abc123', password_confirmation: 'abc123'},
  {email: 'e@f.g', jam_name: '444', password: 'abc123', password_confirmation: 'abc123'}])

songs = [
  {title: '111', description: 'abc123'},
  {title: '222', description: 'abc123'},
  {title: '333', description: 'abc123'},
  {title: '444', description: 'abc123'}]

real_songs = []
users.each_with_index do |user, i|
  song = user.songs.create(songs[i])
  song.contributions.first.update_attribute(:owner, true)
  real_songs << song
end

tracks = [
  {title: 'aaa111', description: 'aaa123'},
  {title: 'bbb222', description: 'bbb123'},
  {title: 'ccc333', description: 'ccc123'},
  {title: 'ddd444', description: 'ddd123'}]

real_songs.each_with_index do |song, i|
  track = song.tracks.create(tracks[i])
end