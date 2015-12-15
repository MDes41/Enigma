require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require 'pry'

class DecryptTest < Minitest::Test
  def test_that_decrypt_is_a_class
    assert Decrypt.new(".3p4peq20,d")
  end

  def test_decrypt_cyper_map_is_created
    c = Decrypt.new(".3p4peq20,d")

    assert_equal 2, c.cypher_map
  end

  def test_that_message_is_decrypted
    e = Decrypt.new(".3p4peq20,d", 12345, 121215 )

    assert_equal "test string", e.decrypted_message
  end

  def test_that_decrypted_message_is_the_output
    skip
    assert_equal "Test String", Decrypt.new(".3p4peq20,d", 12345, 121215)
  end
end
