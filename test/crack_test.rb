require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require 'pry'

class CrackTest < Minitest::Test
#coded this is so secret ..end.. key 12345
  def test_that_crack_is_a_class
    assert c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
  end

  def test_cracked_message_values_with_date
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal [6, 34, 22, 2, 40, 34, 28], c.cracked_message_values_with_date[-7..-1]
  end

  def test_create_unknown_abcd_key_arr_to_match_message
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal ["C", "D", "A", "B", "C", "D", "A"], c.create_unknown_abcd_key_arr_to_match_message[-7..-1]
  end

  def test_index_abcd_across_last_four_of_message
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
    c.index_abcd_across_last_four_of_message

    assert_equal 3, c.index_A
    assert_equal 0, c.index_B
    assert_equal 1, c.index_C
    assert_equal 2, c.index_D
  end

  def test_last_four_of_encrypted_message
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal [2, 40, 34, 28], c.last_four_of_encrypted_message
  end

  def test_known_characters_values
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal [25, 35, 1, 1], c.known_characters_values
  end

  def test_one_rotation_abcd_key_values
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
    c.one_rotation_abcd_key_values

    assert_equal -27,  c.one_rotation_A
    assert_equal 23,  c.one_rotation_B
    assert_equal -5,  c.one_rotation_C
    assert_equal -33,  c.one_rotation_D
  end

  def test_create_array_of_possible_key_values_abcd
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
    c.create_array_of_possible_key_values_abcd

    assert_equal [["1", "2"], ["5", "1"], ["9", "0"]],  c.index_A_arr
  end

  def test_step_through_and_match_key
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
    c.create_array_of_possible_key_values_abcd
    rotate = c.index_A_arr.rotate


    assert_equal ["1", "2"], c.step_through_and_match_key_ABC(rotate, c.index_B_arr )
  end

  def test_get_the_last_key_value_D
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal ["4", "5"], c.get_the_individual_key_values_that_match
  end

  def test_get_the_final_key
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal "12345", c.get_the_final_key
  end

end
