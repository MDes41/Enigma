require 'test_helper'
require_relative "../lib/enigma"
require 'minitest/pride'
require 'minitest/autorun'


class EnigmaTest < Minitest::Test
  def test_enigma_is_a_class
    assert enigma_class = Enigma.new
  end

  def test_returns_encrypted_message
    e = Enigma.new
    assert_equal ".3p4peq20,d", e.encrypt("Test String", "12345")
  end

  def test_returns_decrypted_message
    e = Enigma.new
    assert_equal "test string", e.decrypt(".3p4peq20,d", "12345")
  end

  def test_pass_in_todays_date
    e = Enigma.new
    assert_equal 0, e.pass_in_todays_date.to_i - e.pass_in_todays_date.to_i
  end
end
