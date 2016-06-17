require('minitest/autorun')
require_relative('../songs')
require_relative('../song')

class SongsTest < MiniTest::Test

  def setup

  @song_1 = Song.new("LemmeTellYa", "Kidaf")
  @song_2 = Song.new("Controlla", "Drake")

  songs = [@song_1, @song_2]

  @songs = Songs.new(songs)

  end

  def test_songs_collection_contains_two_songs
    assert_equal(2, @songs.number_of_songs)
  end

end