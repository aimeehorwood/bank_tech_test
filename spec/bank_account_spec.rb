require "../lib/bank_account"

RSpec.describe BankAccount do
    context "when no transactions added" do
        it "initalially has an empty list" do 
            bank_account = BankAccount.new 
            expect(bank_account.all_transactions).to eq []
        end
    end

    it "can credit the bank account and return the amount" do
        bank_account = BankAccount.new
        bank_account.credit(100,"23/01/2023")
        expect(bank_account.all_transactions.first.credit).to eq 100
        expect(bank_account.all_transactions.first.date).to eq "23/01/2023"
    end 

    it "can credit the bank account and update the balance to the amount" do
        bank_account = BankAccount.new
        bank_account.credit(100,"23/01/2023")
        expect(bank_account.all_transactions.first.balance).to eq -100
        expect(bank_account.all_transactions.first.date).to eq "23/01/2023"
    end 


    it "can debit the bank account and return the amount" do 
        bank_account = BankAccount.new
        bank_account.debit(55.40,"25/01/2023")
        expect(bank_account.all_transactions.first.debit).to eq 55.40
        expect(bank_account.all_transactions.first.date).to eq "25/01/2023"
    end  

    it "can debit the bank account and update the balance to the amount" do
        bank_account = BankAccount.new
        bank_account.debit(55.40,"25/01/2023")
        expect(bank_account.all_transactions.first.balance).to eq 55.40
        expect(bank_account.all_transactions.first.date).to eq "25/01/2023"
    end 
    
end