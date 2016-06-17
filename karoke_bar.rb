class KarokeBar

  attr_reader(:rooms, :songs, :guests)

  def initialize(rooms, songs, guests)
    @rooms = rooms
    @songs = songs
    @guests = guests
  end

  def number_of_rooms()
    return @rooms.count
  end

  def number_of_songs()
    return @songs.count
  end

  def number_of_guests()
    return @guests.count
  end



end