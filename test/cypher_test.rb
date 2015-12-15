require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cypher'
require 'pry'

class CypherTest < Minitest::Test
  def test_cypher_is_a_class
      assert c = Cypher.new
    end

    def test_that_alphabet_is_set_up
      c = Cypher.new

      assert_equal ["a", "b", "c", "d"], c.full_cypher_arr[0..3]
    end

    def test_that_additional_keys_are_an_array
      c  = Cypher.new

      assert_equal ["0", "1", "2", "3"], c.full_cypher_arr[26..29]
    end

    def test_full_cypher_arr_is_39_char_long
      c = Cypher.new

      assert_equal 39, c.full_cypher_arr.count
    end

    def test_puts_cypher_array_into_reverse
      c = Cypher.new

      assert_equal ["d", "c", "b", "a"], c.full_cypher_arr_bkwrd[-4..-1]
    end

  
  end
