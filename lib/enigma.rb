require 'pry'
require_relative 'decrypt'
require_relative 'encrypt'
require_relative 'crack'

class Enigma

  def encrypt(my_message, key="12345", date = pass_in_todays_date)
    Encrypt.new(my_message, key, date).encrypted_message
  end

  def decrypt(my_message, key="12345", date = pass_in_todays_date)
    Decrypt.new(my_message, key, date).decrypted_message
  end

  def crack(my_message, date = pass_in_todays_date)
    Crack.new(my_message, date).cracked_message
  end

  def pass_in_todays_date
    t = Time.new
    string_date = t.strftime("%d%m%y")
    string_date
  end


end



__FILE__
e = Enigma.new
my_message = "this is so secret ..end.."
puts output = e.encrypt(my_message, "00123", "111415")
puts e.decrypt(output, "00123", "111415")
puts e.crack(output, "111415")
