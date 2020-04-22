require 'bank'

# Test Bank class and methods
describe Bank do
  context 'Bank class will' do
    it 'creates a Bank class' do
      bank = Bank.new("client_name")
      expect(bank).to be_kind_of(Bank)
    end
  end  
  context 'Initialize Bank' do
    it 'initialize with Operations and Print objects correctly within' do
      client = "John Doe"
      instance = Bank.new(client)
      instance.operations.should_not be_nil
      instance.print.should_not be_nil
      instance.operations.should == instance.operations
      instance.print.should == instance.print
    end
  end
end
