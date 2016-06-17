class Room

  attr_reader(:name, :capacity)
  attr_accessor(:status)

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @songs = []
  end

  def guests_in_room()
    return @guests.count
  end

  def songs_in_room()
    return @songs.count
  end

  def add_song_to_room(song)
    return @songs << song
  end

  def add_guest_to_room(guest)
    return @guests << guest
  end

  def add_multiple_guests_to_room(guests)
    return @guests.concat(guests)
  end

  def add_multiple_songs_to_room(songs)
    return @songs.concat(songs)
  end

end