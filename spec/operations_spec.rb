require 'operations'

# Test Operations class and methods within the Bank class, to test Dependency injection is working properlyt.
describe Operations do
  context 'Operations class will' do
    it 'create a Operations class' do
      operation = Operations.new("client_name")
      expect(operation).to be_kind_of(Operations)
    end
  end
  context 'Operations method' do
    it '#deposit will respond' do
      operation = Operations.new("client_name")
      expect(operation).to respond_to(:deposit)
    end
    it '#withdrawal will respond' do
      operation = Operations.new("client_name")
      expect(operation).to respond_to(:withdrawal)
    end
    it '#deposit will return correct result' do
      client = "John Doe" 
      instance = Bank.new(client)
      date = instance.operations.date
      expect(instance.operations.deposit(1000)).to eq([["credit", date, 1000, 1000]])
    end
    it '#deposit + withdrawal will return correct result' do
      client = "John Doe"
      instance = Bank.new(client)
      date = instance.operations.date
      instance.operations.deposit(300)
      expect(instance.operations.withdrawal(100)).to eq([["credit", date, 300, 300], ["debit", date, 100, 200]])
    end 

    it '#deposit + withdrawal will return correct balance' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.operations.deposit(300)
      instance.operations.withdrawal(100)
      expect(instance.operations.balance).to eq(200)
    end 
  end
  it '#date will show the date correctly' do
    client = "John Doe"
    instance = Bank.new(client)
    date = Time.new.strftime("%d/%m/%Y")
    expect(instance.operations.date).to eq(date)
  end

  it '#balance? will be true or false correctly' do
    client = "John Doe"
    instance = Bank.new(client)
    # @balance starts in 0 when instance is instantiated.
    expect(instance.print.account.balance?(10)).to eq(true)
    instance.print.account.deposit(50)
    # @balance now is 50.
    expect(instance.print.account.balance?(40)).to eq(false)
  end
end
