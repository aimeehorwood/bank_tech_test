require "bank_account"
require "transactions"

RSpec.describe "bank account and transactions integration" do 
    it "can add transaction through #debit_account method and return transaction history with - balance" do 
        bank_account = BankAccount.new
        transaction = Transactions.new
        transaction.debit_account(500)
        bank_account.add_transaction(transaction)
        expect(bank_account.view_history).to eq ["24/01/2023 || Credit: 0 || Debit: 500 || Balance: -500"]
    end

    it "can add transaction through #credit_account method and return transaction history with + balance" do 
        bank_account = BankAccount.new
        transaction = Transactions.new
        transaction.credit_account(500)
        bank_account.add_transaction(transaction)
        expect(bank_account.view_history).to eq ["24/01/2023 || Credit: 500 || Debit: 0 || Balance: 500"]
    end

    it "can add two transactions through #credit_account method and views transaction history" do 
        bank_account = BankAccount.new
        transaction = Transactions.new
        transaction_two = Transactions.new 
        transaction.credit_account(500)
        transaction_two.credit_account(1000)
        bank_account.add_transaction(transaction)
        bank_account.add_transaction(transaction_two)
        expect(bank_account.view_history).to eq ["24/01/2023 || Credit: 500 || Debit: 0 || Balance: 500", "24/01/2023 || Credit: 1000 || Debit: 0 || Balance: 1500"]
    end



end
