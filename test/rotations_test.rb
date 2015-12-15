require_relative '../lib/rotations'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RotationsTest < Minitest::Test
  def test_that_rotations_is_a_class
    assert Rotations.new
  end

  def test_given_key_assigns_to_an_array
    e = Rotations.new

    assert_equal [12, 23, 34, 45], e.key_arr_integers
  end

  def test_that_the_date_is_assigned_to_abcd
    e = Rotations.new

    assert_equal [6, 2, 2, 5], e.date_arr_integers
  end

  def test_add_date_to_key_arr
    e = Rotations.new

    assert_equal [18, 25, 36, 50], e.key_with_date_arr
  end

end
