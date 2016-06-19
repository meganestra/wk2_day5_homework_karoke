require('pry')

class Room

  attr_reader(:name, :capacity, :fee)
  attr_accessor(:status, :cash)

  def initialize(name, capacity, fee)
    @name = name
    @capacity = capacity
    @fee = 10
    @guests = []
    @songs = []
    @cash = 0
  end

  def guests_in_room()
    return @guests.count
  end

  def songs_in_room()
    return @songs.count
  end

  def available_spaces_in_room
    available_spaces = @capacity - guests_in_room
    return available_spaces
  end

  def add_guest_to_room(guest)
    return @guests << guest if (available_spaces_in_room >= 1)
  end

  def check_guest_party_against_capacity(guests)
    return guests.count <= @capacity
  end

  def add_multiple_guests_to_room(guests)
    return @guests.concat(guests) if (check_guest_party_against_capacity(guests) == true) && (available_spaces_in_room >= guests.count)#put these into separate methods?
  end

  def add_song_to_room(song)
    return @songs << song
  end

  def add_multiple_songs_to_room(songs)
    return @songs.concat(songs)
  end

  def check_if_guest_can_afford_fee(guest)
    return guest.money > @fee
  end

  def remove_guest_from_room
    return @guests.pop
  end

  def add_guest_to_room_by_name(guests, name)
    match = guests.find { |guest| guest.name == name }
    return @guests << match
  end

  # def remove_guest_from_room_by_name(name)
    # for guest in @guests
    #   return guest.index if (guest.name == name)
    # @guests.delete_at(index)
    # break
    # end
  #   match = @guests.find { |guest| guest.name == name }
  #   @guests.delete(match)
  #   return @guests
  # end

  def individual_guest_can_afford_fee(guest)
    return guest.money > @fee
  end

  def individual_guest_make_payment(guest)
    return @cash += @fee if individual_guest_can_afford_fee(guest) == true
  end

end



















