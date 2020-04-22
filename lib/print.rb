require_relative 'operations'
require_relative 'bank'

class Print
  attr_accessor :account
  def initialize(client)
    @account = Operations.new(client)
  end
  
  def print_statement
    puts "   Date   || Credit || Debit || Balance"
    puts "---------------------------------------"
    @account.account.each do |_name, account_data|
      account_data.each do |data_row|
        if data_row[0] === "credit"
          puts "#{data_row[1]}   |  #{data_row[2]}            |  #{data_row[3]}"
        elsif data_row[0] === "debit"
          puts "#{data_row[1]}   |           #{data_row[2]}   |  #{data_row[3]}"
        end
      end
    end
  end
end
