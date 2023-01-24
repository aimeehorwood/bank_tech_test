class BankAccount
  def initialize
    @balance = 0
    @transaction_history = []
  end

  def add_transaction(transaction)
    calculate_balance(transaction)

    @transaction_history << transaction
  end

  def view_history
    transactions_string = []
    @transaction_history.each do |transaction|
      transactions_string << "#{transaction.date} || Credit: #{transaction.credit} || Debit: #{transaction.debit} || Balance: #{transaction.balance}"
    end
    transactions_string
  end

  def calculate_balance(transaction)
    if transaction.credit > 0
      transaction.balance = @balance + transaction.credit
    elsif transaction.debit > 0
      transaction.balance = @balance - transaction.debit
    end
    @balance = transaction.balance
    return @balance
  end
end
