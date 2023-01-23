require "transactions"

RSpec.describe Transactions do
  it "constructs" do
    transactions = Transactions.new
    expect(transactions.return_date).to eq "23/01/2023"
  end
end
