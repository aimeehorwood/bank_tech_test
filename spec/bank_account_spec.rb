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
        expect(bank_account.all_transactions.first.balance).to eq 100
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
        expect(bank_account.all_transactions.first.balance).to eq -55.40
        expect(bank_account.all_transactions.first.date).to eq "25/01/2023"
    end 

    it "can handle several transactions on different days and return correct values" do 
        bank_account = BankAccount.new
        bank_account.debit(100,"22/01/2023")
        bank_account.credit(50,"23/01/2023")
        bank_account.debit(30,"24/01/2023")
        bank_account.credit(1000,"25/01/2023")
        expect(bank_account.all_transactions[0].date).to eq "22/01/2023"
        expect(bank_account.all_transactions[0].debit).to eq 100
        expect(bank_account.all_transactions[1].credit).to eq 50
        expect(bank_account.all_transactions[2].debit).to eq 30
        expect(bank_account.all_transactions[3].credit).to eq 1000
        expect(bank_account.all_transactions[3].date).to eq "25/01/2023"
    end
end