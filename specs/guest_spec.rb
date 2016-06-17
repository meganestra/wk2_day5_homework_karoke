require('minitest/autorun')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan", 20)
  end

  def test_guest_has_name
    assert_equal("Megan", @guest_1.name)
  end

  def test_guest_has_money
    assert_equal(20, @guest_1.money)
  end


end