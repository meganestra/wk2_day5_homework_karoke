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

end