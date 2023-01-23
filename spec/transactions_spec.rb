require "transactions"

RSpec.describe Transactions do
  it "initializes with date" do
    transactions = Transactions.new
    expect(transactions.return_date).to eq "23/01/2023"
  end

  it "initializes with an empty array of transactions" do 
    transactions = Transactions.new 
    expect(transactions.return_all_transactions).to eq []
  end 
end
