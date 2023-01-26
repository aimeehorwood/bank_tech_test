# frozen_string_literal: true

require 'transactions'

RSpec.describe Transactions do
  it 'can return date from a single transaction' do
    transaction = Transactions.new('25/01/2023', 100, 0, 0)
    expect(transaction.date).to eq('25/01/2023')
  end

  it 'can return credit from a single transaction' do
    transaction = Transactions.new('25/01/2023', 100, 0, 0)
    expect(transaction.credit).to eq 100
  end

  it 'can return debit from a single transaction' do
    transaction = Transactions.new('25/01/2023', 0, 10.32, 0)
    expect(transaction.debit).to eq 10.32
  end

  it 'can return balance from a single transaction' do
    transaction = Transactions.new('25/01/2023', 0, 10.32, 10.32)
    expect(transaction.balance).to eq 10.32
  end
end
