require 'pry'
require_relative 'encryption_engine'
require_relative 'decrypt'

class Crack
  attr_reader :unknown_abcd_key_arr,
              :index_A, :index_B, :index_C, :index_D,
              :one_rotation_A, :one_rotation_B, :one_rotation_C, :one_rotation_D,
              :index_A_arr, :index_B_arr, :index_C_arr, :index_D_arr,
              :cracked_message

  #decrypts encrypted message by finding the key first and passing it to decrypt
  def initialize(my_message, date=121215)
    @my_message = my_message
    @date = date
    @wheels = 4
    @key = get_the_final_key
    @cracked_message = Decrypt.new(@my_message, @key, @date).decrypted_message
  end

  #finds the aski values of the message with a key of 00000 and todays date rotation
  def cracked_message_values_with_date
    e =  EncryptionEngine.new(@my_message, "00000", @date, 2)
    e.total_rotations_arr
  end

  #make sure the message starts at ABCD and is in alignment all the way through
  def create_unknown_abcd_key_arr_to_match_message
    arr_multiplyer = cracked_message_values_with_date.count / @wheels
    extra_letters = cracked_message_values_with_date.count % @wheels

    unknown_abcd_key_arr = ["A", "B", "C", "D"] * arr_multiplyer
    if extra_letters != 0
      unknown_abcd_key_arr += ["A", "B", "C", "D"][0,extra_letters]
    end
    unknown_abcd_key_arr
  end

  #find where the ABCD align with the end of the message to compare to
  def index_abcd_across_last_four_of_message
    @index_A = create_unknown_abcd_key_arr_to_match_message[-4..-1].index("A")
    @index_B = create_unknown_abcd_key_arr_to_match_message[-4..-1].index("B")
    @index_C = create_unknown_abcd_key_arr_to_match_message[-4..-1].index("C")
    @index_D = create_unknown_abcd_key_arr_to_match_message[-4..-1].index("D")
  end

  #grab the last four of the encryted message "nd.."
  def last_four_of_encrypted_message
    cracked_message_values_with_date[-4..-1]
  end

  #assigns aski values to "nd.."
  def known_characters_values
    known_characters = "nd.."
    e =  EncryptionEngine.new(known_characters, "00000", @date, 2)
    e.convert_letters_to_numbers_arr
  end

  #finds the difference between known aski values and encrypted message
  def one_rotation_abcd_key_values
    index_abcd_across_last_four_of_message
    @one_rotation_A = known_characters_values[@index_A] - last_four_of_encrypted_message[@index_A]
    @one_rotation_B = known_characters_values[@index_B] - last_four_of_encrypted_message[@index_B]
    @one_rotation_C = known_characters_values[@index_C] - last_four_of_encrypted_message[@index_C]
    @one_rotation_D = known_characters_values[@index_D] - last_four_of_encrypted_message[@index_D]
  end

  #loop to create array [[1,2],[2,3],[3,4]]
  def loop_to_create_array_with_possible_key_values(one_rotation_arr)
    index_arr = []
    while one_rotation_arr < 100
      if one_rotation_arr > 0
        index_arr << ("%02d" % one_rotation_arr).chars
        if index_arr == [["3","9"],["7","8"]]
          index_arr << ["0","0"]
        end
      end
      one_rotation_arr += 39
    end
    index_arr
  end

  #all possible rotation values for each letter ABCD separated by digit [1,2]
  def create_array_of_possible_key_values_abcd
    one_rotation_abcd_key_values
    @index_A_arr = loop_to_create_array_with_possible_key_values(@one_rotation_A)
    @index_B_arr = loop_to_create_array_with_possible_key_values(@one_rotation_B)
    @index_C_arr = loop_to_create_array_with_possible_key_values(@one_rotation_C)
    @index_D_arr = loop_to_create_array_with_possible_key_values(@one_rotation_D)
  end

  #loop to match last and first digit and last digit of key values
  def step_through_and_match_key_ABC(first_arr, second_arr)
    index = 0
    until first_arr[0].last == second_arr[index].first
      if first_arr[0].last != second_arr[index].first
        index += 1
        if second_arr[index] == nil
          first_arr = first_arr.rotate
          index = 0
        end
      end
    end
    first_arr = first_arr[0]
  end

  #assigns individual key values to the letters.
  def get_the_individual_key_values_that_match
    create_array_of_possible_key_values_abcd
    @index_A_arr = step_through_and_match_key_ABC(@index_A_arr, @index_B_arr)
    @index_B_arr = step_through_and_match_key_ABC(@index_B_arr, @index_C_arr)
    @index_C_arr = step_through_and_match_key_ABC(@index_C_arr, @index_D_arr)

    until @index_C_arr.last == @index_D_arr[0].first
      @index_D_arr = @index_D_arr.rotate
    end
    @index_D_arr = @index_D_arr[0]
  end

  #puts the final key value together in a string and passes it to initialize
  def get_the_final_key
    get_the_individual_key_values_that_match

    final_key = @index_A_arr + [@index_B_arr[1]] + [@index_C_arr[1]] + [@index_D_arr[1]]
    final_key.join
  end

end

if __FILE__ == $PROGRAM_NAME
encrypted = File.read(ARGV[0])
date = ARGV[2]
# binding.pry
output = Crack.new(encrypted, date)
cracked = output.cracked_message
File.write(ARGV[1], cracked)
end
