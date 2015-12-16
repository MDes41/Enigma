require 'pry'
require_relative 'decrypt'
require_relative 'encrypt'

class Enigma

  def encrypt(my_message, key="12345")
    e = Encrypt.new(my_message, key)
    e.encrypted_message
  end

  def decrypt(my_message, key="12345")
    e = Decrypt.new(my_message, key)
    e.decrypted_message
  end


end


e = Enigma.new
my_message = "this is so secret ..end.."
puts output = e.encrypt(my_message)
puts e.decrypt(output, "00000")
