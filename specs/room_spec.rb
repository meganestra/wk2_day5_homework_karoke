require('minitest/autorun')
require_relative('../room')

class RoomTest < MiniTest::Test

  def setup
    @room_1 = Room.new("Room 1", 5)
  end

  def test_room_has_name
    assert_equal("Room 1", @room_1.name)
  end

  def test_room_has_capacity_limit
    assert_equal(5, @room_1.capacity)
  end

  def test_if_room_is_empty
    assert_equal(0, @room_1.guests_in_room)
  end

end