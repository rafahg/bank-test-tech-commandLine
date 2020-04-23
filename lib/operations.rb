require_relative 'print'
require_relative 'bank'

class Operations 
  attr_reader :client, :account, :balance, :client_name

  def initialize(client)
    @account = { client => [] }
    @client_name = client 
    @balance = 0
  end
  
  def deposit(amount)
    @account[client_name].push(["credit", self.date, amount, @balance += amount]).reverse
  end
    
  def withdrawal(amount)
    raise 'Not enough funds in the account' if self.balance?(amount)
    @account[client_name].push(["debit", self.date, amount, @balance -= amount])
  
  end

  def balance?(amount)
    (@balance - amount < 0)
  end 

  def date 
    d = Time.new
    d.strftime("%d/%m/%Y")
  end
end

 