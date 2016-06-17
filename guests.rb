class Guests

  attr_reader(:guests)

  def initialize(guests)
    @guests = guests
  end

  def number_of_guests
    return @guests.count
  end


end