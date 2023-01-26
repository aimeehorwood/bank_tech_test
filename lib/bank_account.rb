require_relative "../lib/transactions"
require_relative "../lib/statement_printer"

class BankAccount
  attr_reader :all_transactions

  def initialize(transactions_class = Transactions)
    @transactions_class = transactions_class
    @all_transactions = []
    @balance = 0
  end

  def all_transactions
    return @all_transactions
  end

  def credit(amount, date)
    @balance += amount
    add_transaction(amount, 0, date)
  end

  def debit(amount, date)
    @balance -= amount
    add_transaction(0, amount, date)
  end

  def add_transaction(credit, debit, date)
    @all_transactions << @transactions_class.new(date, credit, debit, @balance)
  end

  def print_my_statement
    sort_transactions_by_date
    Printer.new.print_statement(@all_transactions)
  end

  def sort_transactions_by_date 
    @all_transactions.sort! {|a,b| b.date <=> a.date}
  end

end


