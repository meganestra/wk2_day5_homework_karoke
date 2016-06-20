require('minitest/autorun')
require_relative('../karoke_bar')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class KarokeBarTest < MiniTest::Test

  def setup
    @room_1 = Room.new("Room 1", 5)
    @room_2 = Room.new("Room 2", 10)

    @song_1 = Song.new("LemmeTellYa", "Kidaf")
    @song_2 = Song.new("Controlla", "Drake")

    @guest_1 = Guest.new("Megan")
    @guest_2 = Guest.new("Jess")

    rooms = [@room_1, @room_2]
    songs = [@song_1, @song_2]
    guests = [@guest_1, @guest_2]

    @karoke_bar = KarokeBar.new(rooms, songs, guests)
  end

  def test_number_of_rooms_in_karoke_bar
    assert_equal(2, @karoke_bar.number_of_rooms)
  end

  def test_number_of_songs_in_karoke_bar
    assert_equal(2, @karoke_bar.number_of_songs)
  end

  def test_number_of_guests_in_karoke_bar
    assert_equal(2, @karoke_bar.number_of_guests)
  end


end