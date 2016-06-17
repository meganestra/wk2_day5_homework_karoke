require('minitest/autorun')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup
    @song_1 = Song.new("LemmeTellYa", "Kidaf")
  end

  def test_song_has_song_title
    assert_equal("LemmeTellYa", @song_1.song_title)
  end

  def test_song_has_artist_name
    assert_equal("Kidaf", @song_1.artist_name)
  end

end