require "transactions"

RSpec.describe Transactions do
  it "initializes with date" do
    time_one = Time.new(2023, 1, 23)
    transactions = Transactions.new
    date = Time.now.strftime("%d/%m/%Y")
    expect(transactions.return_date).to eq date
  end

  it "initializes with 0 for credit" do
    transactions = Transactions.new
    expect(transactions.return_credit).to eq 0
  end

  it "initializes with 0 for debit" do
    transactions = Transactions.new
    expect(transactions.return_debit).to eq 0
  end

  it "initializes with 0 for balance" do
    transactions = Transactions.new
    expect(transactions.return_balance).to eq 0
  end
end

describe "#credit method" do
  it "updates credit from 0 to given number" do
    transactions = Transactions.new
    transactions.credit_account(500)
    expect(transactions.return_credit).to eq 500
  end
end

describe "#debit method" do
  it "updates debit from 0 to given number" do
    transactions = Transactions.new
    transactions.debit_account(500)
    expect(transactions.return_debit).to eq 500
  end
end


