require('minitest/autorun')
require_relative('../room')

class RoomTest < MiniTest::Test

  def setup
    # @guest_1 = Guest.new("Megan")
    # @guest_2 = Guest.new("Jess")
    # @guest_3 = Guest.new("Nat")

    # @song_1 = Song.new("LemmeTellYa", "Kidaf") 
    # @song_2 = Song.new("Controlla", "Drake") 
    # @song_3 = Song.new("Baby Blue", "Action Bronson") 

    # @guests = [@guest_1, @guest_2, @guest_3]
    # @songs = [@song_1, @song_2, @song_3]

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

  def test_if_room_has_no_songs
    assert_equal(0, @room_1.songs_in_room)
  end


end