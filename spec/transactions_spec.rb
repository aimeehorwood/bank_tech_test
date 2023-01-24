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
end
