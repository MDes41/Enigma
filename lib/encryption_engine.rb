require 'pry'

class EncryptionEngine
    attr_reader :cypher_map,
                :initial_message_arr,
                :message_count,
                :rotations_arr,
                :aski_rotations_arr,
                :convert_letters_to_numbers_arr,
                :total_rotations_arr,
                :convert_numbers_back_to_letters_arr,
                :put_final_message_back_together

    # takes a string makes it an array
    # assigns aski values to the string
    # adds date and key array
    # adds string array and key array together
    # assigns aski values to the string
    # converts back to string
    
    def initialize(message, key=12345, date=121215, cypher=1)
      @message = message
      @key = key
      @date = date
      @cypher_map = cypher
      @cypher_map = pick_a_cypher_map
    end

    def pick_a_cypher_map
      if @cypher_map == 1
        c = Cypher.new
        c.full_cypher_arr
      else
        c = Cypher.new
        c.full_cypher_arr_bkwrd
      end
    end

    def initial_message_arr
      @message.downcase.tr(" ", "_").chars
    end

    def message_count
      initial_message_arr.count
    end

    def rotations_arr
      r = Rotations.new(@key, @date)
      r.extend_key_with_date_arr(message_count)
      r.key_with_date_arr_extended
    end

    def convert_letters_to_numbers_arr
      arr = initial_message_arr.map do |each|
        @cypher_map.index(each)
      end
    end

    def total_rotations_arr
      index = -1
      arr = convert_letters_to_numbers_arr.map do |each|
        index += 1
        rotations_arr[index] + each
      end
    end

    def convert_numbers_back_to_letters_arr
      arr = total_rotations_arr.map do |each|
        @cypher_map[each % 39]
      end
    end

    def put_final_message_back_together
      convert_numbers_back_to_letters_arr.join.tr("_", " ")
    end


end
