require 'pry'

class Rotations
  attr_reader :key_arr_integers,
              :date_arr_integers,
              :key_with_date_arr,
              :key_with_date_arr_extended


  def initialize(key=12345, date=121215)
    abcd_rotations_split(key)
    date_rotations_split(date)
    add_date_to_key_arr
    @wheels = 4
  end


  def abcd_rotations_split(key)
    temporary_key_arr = key.to_s.chars
    a = temporary_key_arr[0..1].join("").to_i
    b = temporary_key_arr[1..2].join("").to_i
    c = temporary_key_arr[2..3].join("").to_i
    d = temporary_key_arr[3..4].join("").to_i
    @key_arr_integers = [a, b, c, d]
  end

  def date_rotations_split(date)
    temporary_date_arr = date ** 2
    temporary_string_of_dates = temporary_date_arr.to_s.chars[-4..-1]
    @date_arr_integers = temporary_string_of_dates.map{ |i| i.to_i }
  end

  def add_date_to_key_arr
    index = -1
    @key_with_date_arr = @key_arr_integers.map do |number|
      index += 1
      @date_arr_integers[index] + number
    end
  end

  def extend_key_with_date_arr(length_of_message)

    arr_multiplyer = length_of_message / @wheels
    extra_letters = length_of_message % @wheels

    @key_with_date_arr_extended = @key_with_date_arr * arr_multiplyer
    if extra_letters != 0
      @key_with_date_arr_extended += @key_with_date_arr[0,extra_letters]
    end
  end

end
