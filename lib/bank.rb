require_relative 'operations'
require_relative 'print'

class Bank

  attr_accessor :operations, :print

  def initialize(client)
    @operations = Operations.new(client)
    @print = Print.new(Operations.new(client))
   
  end

end
