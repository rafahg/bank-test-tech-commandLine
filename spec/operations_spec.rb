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
      expect(instance.operations.deposit("14/01/10", 100)).to eq([["credit", "14/01/10", 100, 100]])
    end
    it '#deposit + withdrawal will return correct result' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.operations.deposit("14/01/10", 300)
      expect(instance.operations.withdrawal("14/02/10", 100)).to eq([["credit", "14/01/10", 300, 300], ["debit", "14/02/10", 100, 200]])
    end 

    it '#deposit + withdrawal will return correct balance' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.operations.deposit("14/01/10", 300)
      instance.operations.withdrawal("14/02/10", 100)
      expect(instance.operations.balance).to eq(200)
    end 
  end

end
