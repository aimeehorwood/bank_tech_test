require "bank_account"
require "transactions"


RSpec.describe "Bank Account" do 
    it "views transaction history" do 
        bank_account = BankAccount.new
        transaction = Transactions.new
        transaction.debit_account(500)
        bank_account.add_transaction(transaction)
        expect(bank_account.view).to eq [["24/01/2023", 0, 500]]
    end
end
