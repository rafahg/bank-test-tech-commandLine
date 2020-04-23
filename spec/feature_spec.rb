describe 'User experience' do 
  context 'when no money in the account' do
    it 'there is not enough funds in the account' do
      instance = Bank.new("John Doe")
      expect { instance.print.account.withdrawal(10) }.to raise_error 
    end
  end
end
