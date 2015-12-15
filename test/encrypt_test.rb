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

    assert_equal "a", c.cypher_map[0]
  end
end
