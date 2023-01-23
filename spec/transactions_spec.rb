require "transactions"

RSpec.describe Transactions do
  it "initializes with date" do
    transactions = Transactions.new
    expect(transactions.return_date).to eq "23/01/2023"
  end
end
