# frozen_string_literal: true

require_relative '../lib/bank_account'

RSpec.describe BankAccount do
  context 'when no transactions added' do
    it 'initalially has an empty list' do
      bank_account = BankAccount.new
      expect(bank_account.all_transactions).to eq []
    end
  end

  context 'when credit method is used for transactions' do
    it 'can credit the bank account and return the amount' do
      bank_account = BankAccount.new
      bank_account.credit(100, '23/01/2023')
      expect(bank_account.all_transactions.first.credit).to eq 100
      expect(bank_account.all_transactions.first.date).to eq '23/01/2023'
    end

    it 'can credit the bank account and update the balance to the amount' do
      bank_account = BankAccount.new
      bank_account.credit(100, '23/01/2023')
      expect(bank_account.all_transactions.first.balance).to eq 100
      expect(bank_account.all_transactions.first.date).to eq '23/01/2023'
    end
  end

  context 'when debit method is used for transactions' do
    it 'can debit the bank account and return the amount' do
      bank_account = BankAccount.new
      bank_account.debit(55.40, '25/01/2023')
      expect(bank_account.all_transactions.first.debit).to eq 55.40
      expect(bank_account.all_transactions.first.date).to eq '25/01/2023'
    end

    it 'can debit the bank account and update the balance to the amount' do
      bank_account = BankAccount.new
      bank_account.debit(55.40, '25/01/2023')
      expect(bank_account.all_transactions.first.balance).to eq(-55.40)
      expect(bank_account.all_transactions.first.date).to eq '25/01/2023'
    end
  end

  context 'when there are several transactions on different days' do
    it 'can return correct values and dates' do
      bank_account = BankAccount.new
      bank_account.debit(100, '22/01/2023')
      bank_account.credit(50, '23/01/2023')
      bank_account.debit(30, '24/01/2023')
      bank_account.credit(1000, '25/01/2023')
      expect(bank_account.all_transactions[0].date).to eq '22/01/2023'
      expect(bank_account.all_transactions[0].debit).to eq 100
      expect(bank_account.all_transactions[1].credit).to eq 50
      expect(bank_account.all_transactions[2].debit).to eq 30
      expect(bank_account.all_transactions[3].credit).to eq 1000
      expect(bank_account.all_transactions[3].date).to eq '25/01/2023'
    end
  end

  context 'printing method' do
    it 'prints out a statement when there are transactions' do
      bank_account = BankAccount.new
      bank_account.credit(500, '17/01/23')
      bank_account.debit(300, '18/01/23')
      expect(bank_account.print_my_statement[0].debit).to eq 300.00
      expect(bank_account.print_my_statement[1].credit).to eq 500.00
      expect(bank_account.print_my_statement[0].balance).to eq 200.00
    end
  end
end
