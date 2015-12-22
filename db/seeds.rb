# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


artists = ["adele", "drake", "justin bieber", "the weeknd", "selena gomez", "meghan trainor", "fetty wap", "ellie goulding", "future", "travis scott", "major lazer", "bryson tiller", "post malone", "ariana grande", "tory lanez", "demi lovato", "j. cole", "coldplay", "wiz khalifa", "dej loaf", "yo gotti", "rae sremmurd", "ty dolla $ign", "big sean"]


while artists.empty? == false
  json = JSON.parse(HTTParty.get "https://itunes.apple.com/search?term=#{artists.pop}&limit=5")

  json["results"].each do |song|
    @song = Song.new
    @song.artist = song["artistName"]
    @song.track_name = song["trackName"]
    @song.preview = song["previewUrl"]
    @song.art_work = song["artworkUrl100"]
    @song.genre = song["primaryGenreName"]
    @song.save
  end
end

puts "all done"