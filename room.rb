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

  def check_room_capacity(guests)
    return guests.count <= @capacity
  end

  def add_guest_to_room(guest)
    return @guests << guest
  end

  def add_multiple_guests_to_room(guests)
    return @guests.concat(guests) if check_room_capacity(guests) == true
  end

  def add_multiple_songs_to_room(songs)
    return @songs.concat(songs)
  end

  # def check_available_room_capacity
  #   if guests_in_room < @capacity
  #     available_space = @capacity - guests_in_room
  #     return "#{name} is not full. There are #{available_space} spaces available."
  #   elsif guests_in_room == @capacity
  #     return "Sorry, #{name} is full"
  #   end
  # end

  # def remaining_room_capacity
  #   available_space = @capacity - guests_in_room
  #   return available_space
  # end

  def available_spaces_in_room(guests)
    available_spaces = @capacity - guests_in_room
    return available_spaces
  end




end




















