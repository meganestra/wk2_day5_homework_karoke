require('minitest/autorun')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan")
    @guest_2 = Guest.new("Jess")
    @guest_3 = Guest.new("Nat")

    @song_1 = Song.new("LemmeTellYa", "Kidaf") 
    @song_2 = Song.new("Controlla", "Drake") 
    @song_3 = Song.new("Baby Blue", "Action Bronson") 

    @guests = [@guest_1, @guest_2, @guest_3]
    @songs = [@song_1, @song_2, @song_3]

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

  def test_if_room_has_one_song
    @room_1.add_song_to_room(@song_1)
    assert_equal(1, @room_1.songs_in_room)
  end

  def test_if_room_has_one_guest
    @room_1.add_guest_to_room(@guest_1)
    assert_equal(1, @room_1.guests_in_room)
  end

  def test_if_room_has_three_guests
    @room_1.add_multiple_guests_to_room(@guests)
    assert_equal(3, @room_1.guests_in_room)
  end

  def test_if_room_has_three_songs
    @room_1.add_multiple_songs_to_room(@songs)
    assert_equal(3, @room_1.songs_in_room)
  end

  def test_if_room_is_full_to_capacity
    @room_1.add_multiple_guests_to_room(@guests)
    assert_equal("Room 1 is not full. There are 2 spaces available.", @room_1.check_available_room_capacity)
  end

  def test_if_room_has_capacity_for_guest_group
    @room_1.add_multiple_guests_to_room(@guests)
    assert_equal(true, @room_1.check_room_capacity(@guests))
  end

end












