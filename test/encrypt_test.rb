require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require 'pry'

class EncryptTest < Minitest::Test
  def test_that_encrypt_is_a_class
    assert Encrypt.new("Test String")
  end

  def test_encrypt_cyper_map_is_created
    c = Encrypt.new("Test String")

    assert_equal 1, c.cypher_map
  end

  def test_that_message_is_encrypted
    e = Encrypt.new("Test String", 12345, 121215 )

    assert_equal ".3p4peq20,d", e.encrypted_message
  end

  def test_that_ecrypted_message_is_the_output
    skip
    assert_equal ".3p4peq20,d", Encrypt.new("Test String", 12345, 121215)
  end
end
