require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require 'pry'

class CrackTest < Minitest::Test
#coded this is so secret ..end.. key 12345
  def test_that_crack_is_a_class
    assert c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
  end

  def test_that_crack_takes_the_last_seven_char
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal "8jw,ajq", c.last_seven_chars
  end

  def test_cracked_message_values_with_date
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal [6, 34, 22, 2, 40, 34, 28], c.cracked_message_values_with_date[-7..-1]
  end

  def test_known_characters_values
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    assert_equal [1, 1, 34, 25, 35, 1, 1], c.known_characters_values
  end

  def test_create_unknown_abcd_key_arr
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")
    c.create_unknown_abcd_key_arr

    assert_equal ["C", "D", "A", "B", "C", "D", "A"], c.unknown_abcd_key_arr[-7..-1]
  end

  def test_index_abcd_across_encrypted_and_known_arr
    c = Crack.new(".6f3p7pi a73w1op.w8jw,ajq")

    asset_equal [], c.index_abcd_across_encrypted_and_known_arr
  end

end
