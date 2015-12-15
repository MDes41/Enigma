require 'pry'
require_relative 'encryption_engine'

class Decrypt
  attr_reader :cypher_map,
              :decrypted_message

  def initialize(message, key=12345, date=121215)
    @message = message
    @key = key
    @date = date
    @cypher_map = 2
    e = EncryptionEngine.new(message, key, date, cypher_map)
    @decrypted_message = e.put_final_message_back_together
    puts @decrypted_message
  end

end
