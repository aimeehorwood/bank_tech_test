require"transactions"
require "statement_printer"

class BankAccount

  attr_reader :transactions

  def initialize(transactions_class = Transactions, printer_class = Printer)
    @transactions_class = transactions_class
    @printer_class = printer_class
    @all_transactions = []
    @balance = 0
  end

  def all_transactions 
    return @all_transactions
  end 

  def credit(amount, date)
    @balance += amount
    add_transaction(amount, " ", date)
  end 

  def debit(amount, date)
    @balance -= amount
    add_transaction(" ", amount, date)
  end

  def add_transaction(credit,debit,date)
    @all_transactions << @transactions_class.new(date,credit,debit,@balance)
  end

  def print_my_statement
    @printer_class.print_statement(@all_transactions)
  end 

end
