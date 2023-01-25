require "../lib/bank_account"

RSpec.describe BankAccount do
    context "when no transactions added" do
        it "initalially has an empty list" do 
            bank_account = BankAccount.new 
            expect(bank_account.all_transactions).to eq []
        end

       
    end


end