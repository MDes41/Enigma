require 'pry'
require_relative 'encryption_engine'

class Decrypt
  attr_reader :cypher_map,
              :decrypted_message

  #decrypts message passing in reverse cypher map to encryption engine

  def initialize(message, key="12345", date=121215)
    @message = message
    @key = key
    @date = date
    @cypher_map = 2
    d = EncryptionEngine.new(message, key, date, cypher_map)
    @decrypted_message = d.put_final_message_back_together
  end

end

__FILE__
# encrypted = File.read(ARGV[0]).delete("\n")
# key = ARGV[2]
# date = ARGV[3]
# output = Decrypt.new(encrypted, key, date)
# decrypted = output.decrypted_message
# File.write(ARGV[1], decrypted)
