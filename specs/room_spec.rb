require('minitest/autorun')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan", 20)
    @guest_2 = Guest.new("Jess", 10)
    @guest_3 = Guest.new("Nat", 30)

    @guest_4 = Guest.new("Marie", 5)
    @guest_5 = Guest.new("Ashleigh", 10)
    @guest_6 = Guest.new("Val", 5)
    @guest_7 = Guest.new("Zsolt", 20)
    @guest_8 = Guest.new("Jay", 20)

    @song_1 = Song.new("LemmeTellYa", "Kidaf") 
    @song_2 = Song.new("Controlla", "Drake") 
    @song_3 = Song.new("Baby Blue", "Action Bronson") 

    @guest_party_1 = [@guest_1, @guest_2, @guest_3]
    @guest_party_2 = [@guest_4, @guest_5, @guest_6, @guest_7, @guest_8]
    @songs = [@song_1, @song_2, @song_3]

    @room_1 = Room.new("Room 1", 5, 10)
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

  def test_guest_can_afford_fee
    assert_equal(true, @room_1.check_if_guest_can_afford_fee(@guest_1))
  end

  def test_guest_can_not_afford_fee
    assert_equal(false, @room_1.check_if_guest_can_afford_fee(@guest_4))
  end

  def test_remove_guest_from_room
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    @room_1.remove_guest_from_room
    assert_equal(4, @room_1.guests_in_room)
  end

  def test_add_guest_by_name_to_room
    @room_1.add_guest_to_room_by_name(@guest_party_2, @guest_5.name)
    assert_equal(1, @room_1.guests_in_room)
  end

  # def test_remove_guest_by_name_from_room

  # end

  # def test_guest_party_can_afford_fee
  #   assert_equal(true, @room_1.check_if_guest_party_can_afford_fee(@guest_party_1))
  # end

end





























