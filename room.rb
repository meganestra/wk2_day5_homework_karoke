class Room

  attr_reader(:name, :capacity)
  attr_accessor(:status)

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @status = []
  end

  def guests_in_room()
    return @status.count
  end

end