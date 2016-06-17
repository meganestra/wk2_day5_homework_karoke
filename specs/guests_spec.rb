require('minitest/autorun')
require_relative('../guests')
require_relative('../guest')

class GuestsTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan")
    @guest_2 = Guest.new("Jess")

    guests = [@guest_1, @guest_2]

    @guests = Guests.new(guests)
  end

  def test_guests_collection_contains_two_guests
    assert_equal(2, @guests.number_of_guests)
  end


end