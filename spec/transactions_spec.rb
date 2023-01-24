require "transactions"

RSpec.describe Transactions do
  it "initializes with date" do
    time_one = Time.new(2023, 1, 23)
    transactions = Transactions.new
    allow(Time).to receive(:now).and_return(time_one)
  end

  it "initializes with an empty array of transactions" do
    transactions = Transactions.new
    expect(transactions.return_all_transactions).to eq []
  end

  it "initializes with 0 for credit" do
    transactions = Transactions.new
    expect(transactions.return_credit).to eq 0
  end

  it "initializes with 0 for debit" do
    transactions = Transactions.new
    expect(transactions.return_debit).to eq 0
  end
end
