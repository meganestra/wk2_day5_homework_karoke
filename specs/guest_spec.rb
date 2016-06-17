require('minitest/autorun')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan")

    #@guests = [@guest_1]

  end

  def test_guest_has_name
    assert_equal("Megan", @guest_1.name)
  end


end