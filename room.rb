require('pry')

class Room

  attr_reader(:name, :capacity, :individual_fee, :bar)
  attr_accessor(:status, :cash)

  def initialize(name, capacity, individual_fee)
    @name = name
    @capacity = capacity
    @individual_fee = 10
    @group_fee = 7
    @guests = []
    @songs = []
    @cash = 0
    @bar = {beer: 3, wine: 5}
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

  def check_if_guest_can_afford_individual_fee(guest)
    return guest.money > @individual_fee
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
    return guest.money > @individual_fee
  end

  def individual_guest_make_payment(guest)
    return @cash += @individual_fee if individual_guest_can_afford_fee(guest) == true
  end

  def calculate_group_fee_per_person(guests)
    if guests.count >= 3
      fee_per_person = @group_fee
    else
      fee_per_person = @individual_fee
    end
    return fee_per_person
  end

  def total_guest_party_money(guests)
    total = 0
    for guest in guests
      total += guest.money
    end
    return total
  end

  def guest_party_can_afford_fee(guests)
    return total_guest_party_money(guests) > (calculate_group_fee_per_person(guests) * guests.count)
  end

  def guest_party_has_made_payment(guests)
    total_fee = calculate_group_fee_per_person(guests) * guests.count
    return @cash += total_fee
  end

  def deduct_fee_from_guest_party_money(guests)
    for guest in guests
      guest.money -= calculate_group_fee_per_person(guests)
    end
  end



end



















