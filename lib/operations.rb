require_relative 'print'
require_relative 'bank'

class Operations 
  attr_reader :client, :account, :balance, :client_name

  def initialize(client)
    @account = { client => [] }
    @client_name = client 
    @balance = 0
  end
  
  def deposit(date, amount)
    @account[client_name].push(["credit", date, amount, @balance += amount])
  end
    
  def withdrawal(date, amount)
    @account[client_name].push(["debit", date, amount, @balance -= amount])
  
  end
  
end
