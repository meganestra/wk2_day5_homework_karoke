class Guest

attr_reader(:name, :favourite_song, :favourite_artist)
attr_accessor(:money)

  def initialize(name, money, favourite_song_title, favourite_song_artist)
    @name = name
    @money = money
    @favourite_song = favourite_song
    @favourite_artist = favourite_artist
  end


end