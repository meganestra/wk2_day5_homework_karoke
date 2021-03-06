require('minitest/autorun')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Megan", 20, "Controlla", "Drake")
    @guest_2 = Guest.new("Jess", 10, "Work", "Rihanna")
    @guest_3 = Guest.new("Nat", 30, "Hello", "Adele")

    @guest_4 = Guest.new("Marie", 5, "Baby blue", "Action Bronson")
    @guest_5 = Guest.new("Ashleigh", 10, "I walk the line", "Johnny Cash")
    @guest_6 = Guest.new("Val", 5, "Hot stuff", "Bad Girls")
    @guest_7 = Guest.new("Zsolt", 20, "All shook up", "Elvis")
    @guest_8 = Guest.new("Jay", 20, "Wonderwall", "Oasis")

    @song_1 = Song.new("LemmeTellYa", "Kidaf") 
    @song_2 = Song.new("Controlla", "Drake") 
    @song_3 = Song.new("I walk the line", "Johnny Cash") 
    @song_4 = Song.new("All shook up", "Elvis") 
    @song_5 = Song.new("These boots are made for walkin", "Nancy Sinatra") 
    @song_6 = Song.new("Hello", "Adele") 

    @guest_party_1 = [@guest_1, @guest_2, @guest_3]
    @guest_party_2 = [@guest_4, @guest_5, @guest_6, @guest_7, @guest_8]
    @songs = [@song_1, @song_2, @song_3, @song_4, @song_5, @song_6]

    @room_1 = Room.new("Room 1", 5, 10)
    @room_2 = Room.new("Room 2", 10, 10)
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

  def test_if_room_has_six_songs
    @room_1.add_multiple_songs_to_room(@songs)
    assert_equal(6, @room_1.songs_in_room)
  end

  def test_available_spaces_in_room
    @room_1.add_multiple_guests_to_room(@guest_party_1)
    assert_equal(2, @room_1.available_spaces_in_room)
  end

  def test_no_available_spaces_in_room
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    assert_equal(0, @room_1.available_spaces_in_room)
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
  #   @room_1.add_guest_to_room(@guest_2)
  #   @room_1.remove_guest_from_room_by_name(@guest_2)
  #   assert_equal(0, @room_1)
  # end

  def test_if_individual_guest_can_afford_fee
    assert_equal(true, @room_1.individual_guest_can_afford_fee(@guest_1))
  end

  def test_if_room_has_received_individual_payment
    @room_1.add_guest_to_room(@guest_1)
    assert_equal(10, @room_1.individual_guest_make_payment(@guest_1))
  end

  def test_if_individual_money_has_been_deducted_post_fee_payment
    @room_1.add_guest_to_room(@guest_1)
    @room_1.deduct_fee_from_individual_guest(@guest_1)
    assert_equal(10, @guest_1.money)
  end

  def test_calculate_group_fee_per_person
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    assert_equal(7, @room_1.calculate_group_fee_per_person(@guest_party_2))
  end

  def test_total_group_fee
    assert_equal(60, @room_1.total_guest_party_money(@guest_party_2))
  end

  def test_if_group_can_afford_fee
    assert_equal(true, @room_1.guest_party_can_afford_fee(@guest_party_2))
  end

  def test_if_room_has_received_group_payment
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    assert_equal(35, @room_1.guest_party_has_made_payment(@guest_party_2))
  end

  def test_if_group_money_has_been_deducted_post_fee_payment
    @room_1.add_multiple_guests_to_room(@guest_party_2)
    @room_1.deduct_fee_from_guest_party_money(@guest_party_2)
    assert_equal(25, @room_1.total_guest_party_money(@guest_party_2))
  end

  def test_if_individual_guest_can_afford_beer_from_bar
    @room_1.deduct_fee_from_individual_guest(@guest_1)
    assert_equal(true, @room_1.individual_guest_afford_from_bar(@guest_1))
  end

  def test_if_individual_guest_can_make_payment_for_beer_from_bar
    @room_1.deduct_fee_from_individual_guest(@guest_1)
    @room_1.deduct_beer_cost_from_individual_guest(@guest_1)
    assert_equal(7, @guest_1.money)
  end

  def test_if_bar_receives_payment_for_beer
    @room_1.add_beer_to_cash
    assert_equal(3, @room_1.cash)
  end

  def test_if_guest_can_check_if_room_has_favourite_song
    @room_2.add_multiple_guests_to_room(@guest_party_2)
    @room_2.add_multiple_songs_to_room(@songs)
    assert_equal("Whooo", @room_2.guest_check_if_room_has_song(@guest_5))
  end


end





























