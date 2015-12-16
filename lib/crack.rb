require 'pry'
require_relative 'encryption_engine'

class Crack
  attr_reader :unknown_abcd_key_arr

  def initialize(my_message, date=121215)
    @my_message = my_message
    @date = date
    @wheels = 4
    @A = "A"
    @B = "B"
    @C = "C"
    @D = "D"
  end

  def cracked_message_values_with_date
    e =  EncryptionEngine.new(@my_message, "00000", @date, 2)
    e.total_rotations_arr
  end

  def known_characters_values
    known_characters = "..end.."
    e =  EncryptionEngine.new(known_characters, "00000", @date, 2)
    e.convert_letters_to_numbers_arr
  end

  def create_unknown_abcd_key_arr
    arr_multiplyer = cracked_message_values_with_date.count / @wheels
    extra_letters = cracked_message_values_with_date.count % @wheels

    @unknown_abcd_key_arr = [@A, @B, @C, @D] * arr_multiplyer
    if extra_letters != 0
      @unknown_abcd_key_arr += [@A, @B, @C, @D][0,extra_letters]
    end
  end

  def index_abcd_across_encrypted_and_known_arr
    A_index = @unknown_abcd_key_arr[-7..-1].index("A")
    B_index = @unknown_abcd_key_arr[-7..-1].index("B")
    C_index = @unknown_abcd_key_arr[-7..-1].index("C")
    D_index = @unknown_abcd_key_arr[-7..-1].index("D")

    end_of_message_arr = cracked_message_values_with_date[-7..-1]
    A_index = known_characters_values[A_index] - end_of_message_arr[A_index]
    B_index = known_characters_values[B_index] - end_of_message_arr[B_index]
    C_index = known_characters_values[C_index] - end_of_message_arr[C_index]
    D_index = known_characters_values[D_index] - end_of_message_arr[D_index]

  end

  def last_seven_chars
    @my_message[-7..-1]
  end


end
