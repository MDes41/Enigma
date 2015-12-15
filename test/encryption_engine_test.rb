require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryption_engine'
require 'pry'

class EncryptionEngineTest < Minitest::Test
  def test_that_encryption_engine_is_a_class
    assert EncryptionEngine.new("Test String")
  end

  def test_first_cypher_map_is_chosen
    e = EncryptionEngine.new("Test String")

    assert_equal "a", e.cypher_map[0]
  end

  def test_second_cypher_map_is_chosen
    e = EncryptionEngine.new("Test String", 12345, 121215, 2)

    assert_equal ",", e.cypher_map[0]
  end

  def test_message_is_concated_to_array
    e = EncryptionEngine.new("Test String")

    assert_equal ["t","e","s","t","_","s","t","r","i","n","g"], e.initial_message_arr
  end

  def test_length_of_array_is_calculated
    e = EncryptionEngine.new("Test String")

    assert_equal 11, e.message_count
  end

  def test_rotations_arr_is_returned_with_length_equal_to_message
    e = EncryptionEngine.new("Test String")

    assert_equal 11, e.rotations_arr.count
  end

  def test_convert_letters_to_numbers
    e = EncryptionEngine.new("Test String")


    assert_equal [19, 4, 18, 19, 36, 18, 19, 17, 8, 13, 6], e.convert_letters_to_numbers_arr
  end

  def test_total_rotations_arr
    e = EncryptionEngine.new("Test String")


    assert_equal [37, 29, 54, 69, 54, 43, 55, 67, 26, 38, 42], e.total_rotations_arr
  end

  def test_convert_numbers_back_to_letters_arr
    e = EncryptionEngine.new("Test String")


    assert_equal [".", "3", "p", "4", "p", "e", "q", "2", "0", ",", "d"], e.convert_numbers_back_to_letters_arr
  end

  def test_put_final_message_back_together
    e = EncryptionEngine.new("Test String")

    assert_equal ".3p4peq20,d", e.put_final_message_back_together
  end
end
