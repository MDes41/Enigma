require 'pry'
require_relative 'encryption_engine'

class Encrypt
  attr_reader :cypher_map,
              :encrypted_message

  #encrypts message passing in cypher map to encryption engine

  def initialize(message, key="12345", date=121215)
    @message = message
    @key = key
    @date = date
    @cypher_map = 1
    e = EncryptionEngine.new(message, key, date, cypher_map)
    @encrypted_message = e.put_final_message_back_together
  end

end

__FILE__
# my_message = File.read(ARGV[0]).delete("\n")
# output = Encrypt.new(my_message, "82648", "030415")
# encrypted =  output.encrypted_message
# File.write(ARGV[1], encrypted)
