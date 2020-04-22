require 'print'

describe Print do 
  context 'Print class will' do
    it 'create a Print class instance' do
      printed_statement = Print.new("client_name")
      expect(printed_statement).to be_kind_of(Print)
    end
  end
  context 'Print method' do
    it '#print_statement will respond' do
      printed_statement = Print.new("client_name")
      expect(printed_statement).to respond_to(:print_statement)
    end

    it '#print_statement will print no line' do
      client = "John Doe"
      instance = Bank.new(client)
      expect { instance.print.print_statement }.to output("   Date   || Credit || Debit || Balance\n---------------------------------------\n").to_stdout
    end

    it '#print_statement will print one deposit line in the correct format' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.print.account.deposit("14/01/10", 100)
      expect { instance.print.print_statement }.to output("   Date   || Credit || Debit || Balance\n---------------------------------------\n14/01/10   |  100            |  100\n").to_stdout
    end
    it '#print_statement will print one withdrawal line in the correct format' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.print.account.withdrawal("14/01/10", 100)
      expect { instance.print.print_statement }.to output("   Date   || Credit || Debit || Balance\n---------------------------------------\n14/01/10   |           100   |  -100\n").to_stdout
    end
  end
end
