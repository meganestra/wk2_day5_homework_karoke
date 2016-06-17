require('minitest/autorun')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan")
    @guest_2 = Guest.new("Jess")
    @guest_3 = Guest.new("Nat")

    @guest_4 = Guest.new("Marie")
    @guest_5 = Guest.new("Ashleigh")
    @guest_6 = Guest.new("Val")
    @guest_7 = Guest.new("Zsolt")
    @guest_8 = Guest.new("Jay")

    @song_1 = Song.new("LemmeTellYa", "Kidaf") 
    @song_2 = Song.new("Controlla", "Drake") 
    @song_3 = Song.new("Baby Blue", "Action Bronson") 

    @guest_party_1 = [@guest_1, @guest_2, @guest_3]
    @guest_party_2 = [@guest_4, @guest_5, @guest_6, @guest_7, @guest_8]
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
    @room_1.add_multiple_guests_to_room(@guest_party_1)
    assert_equal(3, @room_1.guests_in_room)
  end

  def test_if_room_has_three_songs
    @room_1.add_multiple_songs_to_room(@songs)
    assert_equal(3, @room_1.songs_in_room)
  end

  def test_available_spaces_in_room
    @room_1.add_multiple_guests_to_room(@guest_party_1)
    assert_equal(2, @room_1.available_spaces_in_room)
  end

  def test_no_available_spaces_in_room
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    assert_equal(0, @room_1.available_spaces_in_room)
  end




end





























