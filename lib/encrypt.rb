require 'pry'
require_relative 'encryption_engine'

class Encrypt
  attr_reader :cypher_map,
              :encrypted_message

  def initialize(message, key=12345, date=121215)
    @message = message
    @key = key
    @date = date
    @cypher_map = 1
    e = EncryptionEngine.new(message, key, date, cypher_map)
    @encrypted_message = e.put_final_message_back_together
    puts @encrypted_message
  end

end
