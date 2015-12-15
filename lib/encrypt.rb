require 'pry'

class Encrypt


  def initialize(message, key=12345, date=121215)
    @message = message
    @key = key
    @date = date
    cypher_map
    @encrypted_message = EncryptionEngine.new(message, key, date, cypher_map)
  end

  def cypher_map
    c = Cypher.new
    c.full_cypher_arr
  end

end
