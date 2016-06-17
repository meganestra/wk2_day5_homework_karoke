class Songs

  def initialize(songs)
    @songs = songs
  end

  def number_of_songs
    return @songs.count
  end

  def remove_song
    return @songs.pop
  end

end